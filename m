Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27554332EAC
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 16:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781109284; cv=none; b=F1amWoVT1BFMLKJrOXd397B9ZiTeTvQcuQGc1r83iw2VfErAHmhFpGeNIVY6f5LHLGuzqT0oBMTRvBBoPjwXsMhg6mp0ipVQu5wbG6XV+nH0q64DjkGLdY6RVKu20SljdD+gPeoJfHXbHBIXrhOKMD0MwAHqGXd1E5kW0RSdI9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781109284; c=relaxed/simple;
	bh=BIE7gkW/4J2dxkYGHiDbLFQ5KlUnz/F1BFTyzaULS7E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MooN+MUGMbPbHpdWKJd/oXNsKGqyucXQX4x6y5PvtyFZEqAzAWHBXjsv5KibAOtoipcRyhC+uOPqqFOhUFEcRwsg38siniBzHt9shkIk5vEROBqfh6rpnxh9jwfKc5U6tg4iQgwtRM807BtkyUWUP/AKtlyG8OttuD45G2wQfbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YuZqHw2D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NBP+7/Nx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YuZqHw2D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NBP+7/Nx"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65AFx3LL2127553
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 16:34:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+XOIWlH40mHwtCgl/V4OVzh5le+vWzs9b3kpiqeGWEw=; b=YuZqHw2DxiLOZgXy
	FHEd1jLR9TZTr1SQAXCLCOkvey5LHWGgBrQyNIGxFxX6k6xORDM3TzmqVCO3Onks
	jzlV/fCkg9/PDKuGWxu5rWE00mroKCs1BDxhKmQP/UR1vadsJ4vxcFWojFmHggLM
	4zgxykU93hyYmvfR7zbOKNgH4zgco8H3b+3O9Kc2NxMmfgNVBFgyJlbSvFUzBSBW
	5W7HmNI4qGplaGOR89HtrM7TFsDOSTuqS2zixq2Un7L3qUN6l/B9NmIeEPMQT5xf
	AnyCOfO4YjCPerFjbovV4XNaPOCuIIIdzKEEhMTh7DUBXPW/x2sceyAkYTK1NR7g
	d+hIbg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq2sejhcd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 16:34:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0bf6904a6so102545575ad.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 09:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781109281; x=1781714081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XOIWlH40mHwtCgl/V4OVzh5le+vWzs9b3kpiqeGWEw=;
        b=NBP+7/NxfWvVIaktGpAND5A4LnvagBDftdIjle4GiWFjx1ebcpB5K78zX17LQtki++
         Rd9taNuICbFN1ogRttyeD3sDuF9HTukAm0h+8gVUw5Tx9wVQ/pcwwENsM8Sr+3jYmHWA
         /7UCJxcf938c5BwaFeLoxh55Z+kuT5pLUO3BUBw4q4+Xkl8PVaJ2nKQ5Zcv8BxJWG7E1
         28CCc12qZFPpZG32e0wjH7iPs7WY8odZaPhyDFaTUcd+hxnEJzvfHARKZLS//H0dmMfb
         RtNtMRZFYLe6CgZvi+Dvtc3pUh4nDt9jTdh0KokzUIyYaRNRPcgPf5vdys1Mfqtp21iH
         fkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781109281; x=1781714081;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+XOIWlH40mHwtCgl/V4OVzh5le+vWzs9b3kpiqeGWEw=;
        b=UZUQIrV68KPJ5zprz6YaHiCBzLgHOPqYNEhEtnkcUAj2kVfrTnPSexu42aS57ZqbyY
         fnfPiBt32kxwznZUFvESXq1ixs9L0wueVkTtqRlG1QcxB6iYYqxJzmENiocToozUzOUo
         E4fq7Qjr+Dr7W2bxt4vWdhJo3oKpnUQhpgJ3INXoOApfUUsZ07NWJtoYMz/drfVb2Ni5
         FFSwKQ5XNG4TciJEZfammK03a35GfpoNfoaNow1k0VuIJT2vnnAeNupQn6JTiwp3xalR
         rfheCAcHHSLEMWi7syInXSNBhsx4qaGb/uLoliL6qmCLpqtYgpl7ePhD6thREwSsV97p
         dlaw==
X-Forwarded-Encrypted: i=1; AFNElJ8ZgXI0UHQY2uehN0JGZrJbUw+G1Luk6kp5Cpdx9eRbUNLzpuT4oS6YBfYjuK04Li1H8wjJAkmOXP4U@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe8xi6iEdrDeKm90Mwq1kppUCr8pl4tVn1JivNFkdfpJpK89lP
	TtxLIUjjAXGfAgqJlIHen5HnfyHlaQlaUymLrXN7HAoOcEVY77mSo2GOqoXs8U7/FGbmODRQIGm
	HPNDRESdRoMyNhnzRWXcV0QJpTg6hpLyGQTA+DDhVBdkq+RrDyQq1y83NIVQieEdE
X-Gm-Gg: Acq92OG6wGw2Ilwn6dceOYdYGS512F7eafgYnIPcBtvcvqPfqLyetScZZnNQ9WAgNvC
	iIfwt89oevTdsiRmFaN39VQNh6iK8FpdKTM3t3PWpkRZJm49Dkf3pRKQM6vbb4J0rx/vxInfI9S
	OlDYTbux3KIdtHHbTLMFDczwxqBECloNf3h2ciL8D6d+8+Ikz1GHUt0LKg0KYVRACVxMdw2ECBC
	kNEIad9jM9tDuFoJOgHuuxm9NFvrJ4vqAQFVKHNx/0NA4gefba5CN1vLBvdERsOKfL8xhEKwCgC
	F96eBw9aSilENpuHsVfNchg7upWlPw6hbxzP3p5UPKveVuOHZKc0JHxUFvR91EWx02q9dccQxWk
	JzYj+V0Fieuwq/OV0Tg4Fk+UsMtosGfo=
X-Received: by 2002:a17:903:41d1:b0:2c0:af09:f3c7 with SMTP id d9443c01a7336-2c1e85c0cbamr301159825ad.30.1781109281096;
        Wed, 10 Jun 2026 09:34:41 -0700 (PDT)
X-Received: by 2002:a17:903:41d1:b0:2c0:af09:f3c7 with SMTP id d9443c01a7336-2c1e85c0cbamr301159285ad.30.1781109280647;
        Wed, 10 Jun 2026 09:34:40 -0700 (PDT)
Received: from [192.168.1.11] ([120.56.195.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649c302sm243953905ad.73.2026.06.10.09.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 09:34:40 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260608-eliza-v3-0-9bdeb7434b28@oss.qualcomm.com>
References: <20260608-eliza-v3-0-9bdeb7434b28@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/3] PCI: qcom: Add support for Eliza
Message-Id: <178110927481.10093.6331910233610738004.b4-ty@kernel.org>
Date: Wed, 10 Jun 2026 22:04:34 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 3uoE_edF4E73eheBktaQjl-7Df0QfZ_s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDE1NiBTYWx0ZWRfX9Xo4PbrEKKG4
 0q3W6/vE2lDHAYop28oVQfV8YhWH/9cMSbyqV03H0/Y3I1Ywx2KjMOMGs8f4RyIsxLPqV5fHjmG
 G0NQYFdJ8Bqtp0z+2gkts4sOs9ecJGq7rXFzqEgm2fDXw/ylOCep1v2m6EJzVcC6+3fCNrmRc9z
 aAh/7Ml8/CdESQpd6a/QBnMwOPeFg3hL9UUO5u8kriOurWz++OYntqQRKp+l1Jes63NbNYad2gs
 cAhcmdiPKjDKLVLFP5/McfUhRPRtmdDYJCqCrCjjmtO2hKbxZ4jWgnjDkoO1cUkSQd6Ihpz3+iv
 sO85gCJXH3Xg2q+2xnYzXvgMjQiD5DDp7omGLziVyqOx7iOSU8eh5o7rYTfGV8/3qxcXiekb2FN
 H4nbedoEv4Dh4iu3OBVhlLJIcW61u2g/VVq3Y13ubbtoK2H1sfcz49MKcEJUW4pAxa7q/J+Memq
 sWRjov7RGsUc6Lgjc8g==
X-Proofpoint-ORIG-GUID: 3uoE_edF4E73eheBktaQjl-7Df0QfZ_s
X-Authority-Analysis: v=2.4 cv=Md1cfZ/f c=1 sm=1 tr=0 ts=6a299222 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=n8UK4BQKCdfH/t0JQ2luxA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=jf34NEdiGforZHx8bOwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100156


On Mon, 08 Jun 2026 14:18:12 +0530, Krishna Chaitanya Chundru wrote:
> This series adds PCIe support for the Qualcomm Eliza SoC. Eliza includes
> two PCIe root complex controllers capable of 8GT/s x1 and 8GT/s x2.
> 
> The QMP PCIe PHY support adds a new Gen3x1 PHY configuration with
> Eliza-specific initialization tables, and reuses the existing SM8550
> Gen3x2 configuration for the x2 PHY instance.
> 
> [...]

Applied, thanks!

[2/3] dt-bindings: PCI: qcom,pcie-sm8550: Add Eliza compatible
      commit: d233626c009a515fb3ed823fcd78cee432701d1e

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

