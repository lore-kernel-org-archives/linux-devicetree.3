Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA7A44E038
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 15:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782833948; cv=none; b=R+ghmNz5GCYNoRLgLZCsreCZpozKbOovJi2TQNQwGbUacyLCOy8jUy1uUgd3ttVONefPdMIohmO1pNnCeAWOGwbwRTl4SfqXNSjywXSWnWHxzkF8KTm2KDHI0/VtPS80i8zwhBQ5Co8Uts64bE98YcC9rg87ckDPju2yijFhS0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782833948; c=relaxed/simple;
	bh=OSbb7xN5YSikelytEh5wz4YfdTkKH7j3hgMOiOt73kw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=A54q/bbA75Yhd0qeOleHsWPS0ZQsfKU2ndL1c8VGrXbC/9dRYZAIHnj/acJ2AZuDyxmg3HWhHIJbRcMJZ39vW2KN1gFv3dyJpqM2pend9DjzriyP64kpcV+auGLbi/VWBwhR2gzSgUA8BZhOUM/luflENXAdw0hgpkWlP1Vlzjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RUrDQsll; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=POLxHsWC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RUrDQsll";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="POLxHsWC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDWRP2152051
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 15:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KbxdBI328xfHBsRU0VHFqUdQ+8MHRSsYefbAul5Sc1U=; b=RUrDQsllXRYC+LYR
	WIy833EfD7V3NyKC3r6FmzjuFAWk6Xr1MN6crwbDiJJsjksc325S8VTUwy/rUy53
	yW5WfQaeedbK/5l2kBIQ4Cg0xSMVq8vWXpPdi5dQByCmSOD/7vA8310+x+snelYc
	qbs/JaBSHUB9SRTZLDqTrMEUwBbNvCzQCh2ubAjeotl319Rv3sqpq5fhzTQn/ctP
	N/gyk64FQW6fKPWAAt5PcN8CjW1U0vOHYhwTZty0FtK2kz9trtyl+rkwCpMA4uHg
	xQlM8ee7tSv++oGZzDKjGfGjXjeubEMN7r7XpPNGPXttYjzw43ofbqcH0KJrtrA5
	EGYL0g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44v4k96n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 15:39:06 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c1f6c5559so5121856eec.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 08:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782833946; x=1783438746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KbxdBI328xfHBsRU0VHFqUdQ+8MHRSsYefbAul5Sc1U=;
        b=POLxHsWCVrLNNjHZCdcRw8onQfYKWAXimHnrmSTzdAgdj223XOsUL2wzK8c/acReWa
         BUyhdoxsnO8+WFGaVM9LuwSOFVyCMkRYVqd2Ewy/Iin0OGKGxcDwfB4YUPHzr5atJETx
         qQ4RUeTtF9mVc/SBYKCa7mRsotmSSmmr4sR0kgZ7NryDnhOrmk2sRfLIFGOSfRiAPgUd
         0YuoF4FtYqBZaB0q6o1EETFYk5iCnDdQdA2NJNdHv/eRlUqvIUzgi9ecobQJ0Jn9vO27
         YTJtRNQaBx088PHKMkkUJ140egN2b1M+l/kG2BGns0hvrRMCLmkFkqksNJaJVEM3Dx+n
         62hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782833946; x=1783438746;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KbxdBI328xfHBsRU0VHFqUdQ+8MHRSsYefbAul5Sc1U=;
        b=VP1+qct1rSatSFirnGJ1hyB0tlN5apb086Tu0hk7qeReczA98poqyT+SvOstf+IWF0
         YySSuVRw2KrO8RLqNCsCGExI0Pui2/3/hTQCUqzIygFAcEeXe1PMyy263tDahWbTi/Xo
         U8gymKX8RXG3kRAqNJ3zcI+Igdtimhz/6Djob7IxgOcSxBjytRaoJbA+dc+phBiIlA9q
         S682bbAXRs9vnOS5Q2A1uYpJg0N/oJ0iHCqTO3GelI6HQBCKZWlNo/lDMZCr2IHf0QKL
         ltRsXK6S/l6eyRVElhJ7By53Ayi2qGpd9uHr614Qd0wL1YdE/Tuek0/FaTIhkEJOjlIM
         +mRA==
X-Forwarded-Encrypted: i=1; AHgh+Rqeb8RTsPBnrTpW5DhO2KgU6UZkpifCcrgG7Ixw9TkqCi7pzxiJoH9XIoPu4dHdDiSpFdWd2E//1n60@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7LfRdqTLqk07sCPPtRFGD5ZszbHv/7VG6B2VQIzUlMHsFutIW
	pdxGN7dUpcmuIoPeBFm6zJPZ5Q2pf+4fpfuc4AY08ITXPxSDjvlVe1HRdcFAYBvpqJc+z0xZEu/
	FCiqP99koGZa7Hxn8ETZtPA6ivk6GwFMoKoWMLKfiv6iLCZvDCEY15+2QmMoiq2yv
X-Gm-Gg: AfdE7cm2XejBEAdkehdECyeQ+gUUeanYevM9sss2nwtMTNqGNK8eazHXnZbcb/uN7Jd
	u1eA8h0dN0pnkjyvJUuLUo7f7JpAQ/AMOx8vLqFY/T65RvWAgWhSW8q+QlCekedFIBnZRmlibLg
	a5mx+dniPLYNpWYcai69K5WXuSifS9X84HWr38cm9nO/42y/q+37Q6E+iTb27CwefJK3gTrF21W
	/f9/E/GvYsejm5Z9Mv9tEyTn5kao0VHTQgAMifr+3RtjunEMLEA7PBrOgXlS8oOGnEY+laF04tp
	MmQrb3npjWcMCmZUGlG56U5r08HdAJCCfuiNKZwpYivvYS5RSLfGvxTksVBHbEjnwNv381zLGt/
	Jy0Vh7XmLNQzbv3CxnJ9TMyxicUBqmQ==
X-Received: by 2002:a05:7300:2151:b0:30b:ed93:5cdc with SMTP id 5a478bee46e88-30ef09e6c47mr732725eec.31.1782833945510;
        Tue, 30 Jun 2026 08:39:05 -0700 (PDT)
X-Received: by 2002:a05:7300:2151:b0:30b:ed93:5cdc with SMTP id 5a478bee46e88-30ef09e6c47mr732683eec.31.1782833944944;
        Tue, 30 Jun 2026 08:39:04 -0700 (PDT)
Received: from QCOM-IvKeorbwK5.na.qualcomm.com ([120.60.61.127])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2f5ed29sm10103096eec.1.2026.06.30.08.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 08:39:03 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Matthew Leung <matthew.leung@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260625-hawi-pcie-v4-0-1a578603cd86@oss.qualcomm.com>
References: <20260625-hawi-pcie-v4-0-1a578603cd86@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/2] PCI: qcom: Add PCIe support for upcoming Hawi
 SoC
Message-Id: <178283393946.298268.1292819046120769296.b4-ty@b4>
Date: Tue, 30 Jun 2026 17:38:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: 5m7ZX11GpToPzb6eaLqE_jS2eI5iuLg7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE0NyBTYWx0ZWRfXwfGKr/eFPHVC
 zFybcz5Y4J+Y8UVy53F/W9wGhLw75Nqs/tUuXaSGmpnNWUDI/UJynjDJ1R7Za00b08pxZafBoTf
 CI0Pk8wQTpOY4RJZNZxr6BYm7luGmXk=
X-Authority-Analysis: v=2.4 cv=JI0LdcKb c=1 sm=1 tr=0 ts=6a43e31a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=H7IkG6lIOHbWVTtTQWLpKw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=WEtzvTudP8oR8f9B9VsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 5m7ZX11GpToPzb6eaLqE_jS2eI5iuLg7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE0NyBTYWx0ZWRfXyinBWCmHxH3E
 +X2KD8QKxI/LBkHQ+13gSQXz0tvRtMwk2o7Pgn2HjiSEeJtAggV2RFNmVlQ3aEOnWKUf8ClKQck
 SsZdwwpwgzcPUMqciqSAg7P5tya4bRuwAwMqikuA2GTG/mspKCjlvEKNglEsYr4Yt99WhvbvGtT
 kGhfZSr2gg7SPNiBloBbKfcLyNQSfT6BOfKlqW+OF+1zvlDzAp5ZdustcfZzsFryO4BhuIzaxn/
 OyVOXkuFkFBdmt5fWTmfNhdAl/TeCRpy63Mf/9+XmdQHQ6prj9QpTGYI9mHFoVvVL5Auc1jXcOx
 Rdb09R2lNc3HBjPh+jkLaZLH8EqUQoRUtT+DjWrnTcGhekkDeJN38D89B1gDIKK4W0lJ4vACI+o
 GU5cY45YzIUxdlPiBwntxhKsTBuBIncQoGW9AqE1Nz+lCOPx5BQFFdOr93+/PwHwKQ+XcLHShPU
 ooZXMLgNgp8UsS2GYqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300147


On Thu, 25 Jun 2026 20:38:57 +0000, Matthew Leung wrote:
> This series adds PCIe support for the Qualcomm Hawi SoC. The Hawi
> platform features two PCIe controllers: one capable of Gen3 x2 operation
> and one capable of Gen4 x1 operation. The first patch adds the device
> tree bindings documentation for the Hawi PCIe controller, and the second
> patch adds driver support by enabling the Hawi compatible string in the
> existing qcom PCIe driver.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: PCI: qcom: Document the Hawi PCIe Controller
      commit: 6c3b60493693b7681bda206515a82cd3f99af543
[2/2] PCI: qcom: Add support for Hawi
      commit: 67db6fece5db59c5fd0d7c0a514eac5c7f37be8a

Best regards,
-- 
மணிவண்ணன் சதாசிவம்


