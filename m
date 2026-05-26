Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D9823909F
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 12:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779800106; cv=none; b=h3cFoH5WLhmnRdp1QZKP6pA9dYFCQBlgY/eC/2Fq/+apInPQ4Kt9QZguEP9ZgLxV2nCykaj5UAWlmZSyvZc+nXgn6q/vaQKKqJ1cmMKNBOa2YQw1TRnCn+oKycHT3PEC1D9BcqZMPKRzgGrO5zmYx8zb9UJuySBwBZwaibzLdug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779800106; c=relaxed/simple;
	bh=CnRPiuF81lBuCpoHlCurFFGdm2XmAncBNOM3KmceBW8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=POd8BY8flxFj5XV9YCy0EMYsu+kQpSScvkpvlSzHMJ+vsybHU0WA+tRf0lQ0QY8vpB6w7vF1j03RSYaO4zxPr3gQNvxGfWbWHxS0kNjY9KEhjKWBd9iSy0xMTya2WxYXVi2ge8q3+mIBC3QCsRMO/vSEItGBN9lTqPJTb79Vono=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RWptDCEj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PIjVC33b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RWptDCEj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PIjVC33b"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsNXn2705368
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 12:55:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IFDcglAGXjSDv6I35QrERo
	oEJdRQga4AJsVg1Timyjs=; b=RWptDCEjFdY2iNxdRLynLUsGu0KCCmEb+yWGoR
	lchKghPw60HsX/xxY9w2EoXdxMz35ahruTp3oCYOUdO+bpGrZnxYoUE7SSWXLEEN
	130HvIhjU0SedSWWdBZ7ySAiu0nw+FEZbbaOXeym+t/4/zgaS7+rVWL4UfDgTKA0
	2SqXMPqtHWf9RNKzVryhiJaMeg3fWH2rW35S5wfP5zgZ2eP1CjVFSspyCia0rxnx
	iQxYmPanYNcjriKQbHAj7ts6S05GyWoiMU/+Yz/dP7L+wFWAFGe9G/7QjtBT1kAw
	j3kAqvSmoANN+ZF3WSHyG2yjzLWduMQAKne90jWncS2qJ4BQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5vghs95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 12:55:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso118171825ad.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779800102; x=1780404902; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IFDcglAGXjSDv6I35QrERooEJdRQga4AJsVg1Timyjs=;
        b=PIjVC33b+N4eCY7jjH+S4Wo6rTMQOB014dz8RLFVxNvkXHM3N1PIsBiE7ADXRxA5HQ
         IUQMBEU5Wb4hB+DmtQW9AR2ItlbpYcTcsj07t4DK5OeLU+kaWJWs174sbD3elOVIE6L7
         L16HcNHp5Gyr9SXThswA1UI3JnItrQnrIXyW/199FDigLNTFLY8ox5NPXcNHWOTfehvD
         YUVf4HWfxITaQVmFK/6coVJAzrLPnCdP1nY/vQiHWvZaURWZehQDkbrVmJdndn/e3hZM
         c58Kpp/JIkRyO5E1EHfCeT232LZ/DBoVBQCiGFZ+TXiv041UTeIGAGQoLM5SAeMUxrh6
         v2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779800102; x=1780404902;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFDcglAGXjSDv6I35QrERooEJdRQga4AJsVg1Timyjs=;
        b=EtAMNbJEFmxjHXPdDZcubrwKwPD5madk8LnS6osGvb5j2vbrHja81wjvJvpqPLqxtU
         RURwUBbZs44VdAIFVqJMARnQvH4EE4gT2AszKArQ+bYPnheTRZmt4wkmD1exxnbDfdj0
         o1sEmy67aDJxsJKThzXTxBbCz7oeZEuGTLK1Dtkq7gxgMmIKkIQOGTLiLyZLg3Ur6il/
         3/B62RqLLdJJjFXuHrBaTv4htkGlmFPHLRRW5ne8pMs9pZSDqr1C04kDrCPcDKRCXUTZ
         IKN1W6E6LvDoKMc3kSsq+Pw1d4N4GqEGUg5zauEK+cJqfCSyRSXedMEIfwsX5yr+ynfH
         k89w==
X-Forwarded-Encrypted: i=1; AFNElJ/d0bQzNc9WVi4vzb1PhQmsLDzdbO6Nc+LN5dwbSICJNBwpLnIK3r/3ITihHnCbYuAOgHy0IvZDwq1a@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3k2yT3yM2uz+BPH0rNKkvNlwfwmktbwI7XiiJr8edjQZnqHKk
	6lUmJLzIOXnWrATc58rRKLsg/W5puhdUdUEQ+VPbwB+oraBzYarzDcQQuBhsr/whDIeIwzwiXcm
	XP8YjC2Yqz1sPlCmnQb6Ug8NpmlxJ7Wr06FagUKotOsLvhWxPINFOl+rc51Bvf8XW
X-Gm-Gg: Acq92OENDG5tfUINe2+mT24GWdJ316uH6H+MApallV7/vweQQZK8l8Q9xaGkaGkm4Er
	o/QqS4EYts1S3HqBqp4qJYlGHNXmsj/ZoCtbWn/arh8TFpmu4wUFSBU2mH+1tejkAK/LfIOVf92
	0ojTbeozlzwnDbCkRyTn/Vvs1l0fB8JEamhm4VV4DnWNFTJ0DkZKSHkQ3yCeVtL5rMnNKDzbxb1
	KEJV14WAEtpfbg2Zg/BOnRI9EkAgnkEjDfqYehQYtmyr/E5U3QC38GMQlAJRpwR8A1VgP5ost9T
	mLchuJl2qdMvaonKmmYrQcopthMrkS9EV/Z5j2lhUlE03TWODOv4wziauwFIAt6mbhFHJNgNfPJ
	DqS10DRGeh8ep6/ehgtvgZBuU+S60rVSXoILYzVlthJ8Xrf94QpAqE6GWNSKw0Dc=
X-Received: by 2002:a17:903:f8b:b0:2b2:5503:1b8c with SMTP id d9443c01a7336-2beb06c4f36mr195265405ad.11.1779800102315;
        Tue, 26 May 2026 05:55:02 -0700 (PDT)
X-Received: by 2002:a17:903:f8b:b0:2b2:5503:1b8c with SMTP id d9443c01a7336-2beb06c4f36mr195265155ad.11.1779800101871;
        Tue, 26 May 2026 05:55:01 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58e4fcfsm129000165ad.71.2026.05.26.05.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 05:55:01 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: gcc-shikra: Add support for the USB3 DP PHY
 reset
Date: Tue, 26 May 2026 18:24:43 +0530
Message-Id: <20260526-shikra-gcc-usb-resets-v1-0-6d9e7fee2998@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABOYFWoC/03MQQ7CIBCF4as0rCWZUqDSq5guYDpUotXKtMbEe
 HfRLnQzyT/J+56CKSdi0VVPkemeOF0vJepdJfDoLyPJNJQWCpQFo6zkYzplL0dEuXKQmZgWloO
 BGPfeYlM7UbZzppgeX/fQb53pthZ+2Z4/vau+tlbu387zVC6eTywVOE1DjLEJ0N3Vhw+eSeJ1m
 tLSVc612lmHtYam9uDawQZtAobWgw1Be2+UQQ2if73eVcTeivAAAAA=
X-Change-ID: 20260526-shikra-gcc-usb-resets-d50ff8a6c319
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=IrYutr/g c=1 sm=1 tr=0 ts=6a159827 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=AmwuVZndQLEihibSxTgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: kbQOqvmf8N7OrzgLSdtyGEg5zLs7E6oY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExMiBTYWx0ZWRfX/fVfPc7tPntW
 XEGp2sHpohERFxzkDXlof1A8z6vMsVFaSW1K4Gmga54vDQHaj9Q+pU7CMHtA8LlEsDJ+Hb57RtO
 BvdYkEJKOb5gDtQD9I+iIwkS87X/+0gXHVqi2Lp2RtTptk40Ri4YisXrVpy3BY4Z9vmyBCV9ZTP
 YATV5vdiEZ63Z2ACUwJfJljDOZUUMiZlPcZfQvx2sDEDnkZhq48N1cjydyd9jgNVqW6Ep5odspH
 3MqXx60yFIzvm3kZIXR3RrSV3dPn8DEMSpkWC4JFXuvVttScQHSdzUB1advQNAa+ahcTSua41qQ
 WjWhZJvrUafIbFSys2p8VJ5aCVKCSEVEPtMjQLrQFEXINAzf/YKBAKPTsasl6ibVUyoSHCXKHMA
 V5rIQgwLrCeC3RZwsWt7erpBkF2n7JNRbrJSPMN6BBMXPCJADS3B41Gz+grrW/XRvskrtYHg9Ki
 j81nIoMSqUuaWgZEbnQ==
X-Proofpoint-GUID: kbQOqvmf8N7OrzgLSdtyGEg5zLs7E6oY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260112

Add bindings and driver support for GCC USB3 DP PHY reset on
Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Imran Shaik (2):
      dt-bindings: clock: qcom: Add the definition for the USB3 DP PHY reset
      clk: qcom: gcc-shikra: Add support for the USB3 DP PHY reset

 drivers/clk/qcom/gcc-shikra.c               | 1 +
 include/dt-bindings/clock/qcom,shikra-gcc.h | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: 9974969c14031a097d6b45bcb7a06bb4aa525c40
change-id: 20260526-shikra-gcc-usb-resets-d50ff8a6c319
prerequisite-change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0:v2
prerequisite-patch-id: 5a0fbdd458785da2d0e850c851a05046672ecadf
prerequisite-patch-id: 1f98e515a52bbeb25e2a960a804afe16c6a472a1
prerequisite-patch-id: a64476b2ba6e0f2a55928baf72ec32672ee0123c
prerequisite-patch-id: d0c8651205232862b40f942929e1efdaa3084eb3

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>

