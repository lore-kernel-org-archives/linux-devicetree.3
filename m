Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BC746C836
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 08:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790583979; cv=none; b=GGXuaj0LqYUr2VTzR7YxfHBD+pBkULG18o9UAYwOCkc8O4H5sj1eXVCpdMtYMIGl2C2fZji/RRF50XSX3GGboiQSVXHN3bi8ZErTQeFqzdRQLCCoXIBqE/x5r7Ay4PUol33PTgxa3lVa8TyFHuUqTH4qWWFRI9WvUO6R3iiwqrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790583979; c=relaxed/simple;
	bh=O9FVM4oq61tu77EUmWttNJpUlnBtfOplel3gkh8wJAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K9JN0zZ3fkK5RH+Djrn4C9T/k8VhxkYyiIvhyOWX7P2PM0fILt9if9pJpYxkvkUdA8fXpIaWRsf08jGG4sIhCMh6teE6Eml/t5wZZRCGwBz6BLHkfV+6qG6GZxkbh7zjHw6KFYLayDdRig+na2HZwC7YOKVxhZq7tmyRnZLBMgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oYfpOOlH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LTtC32Ev; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oYfpOOlH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LTtC32Ev"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S803l31872252
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 08:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jaRIHfyS839pnGmtubgjSGEcFcrMTPnSFxHKmD/d3ug=; b=oYfpOOlHfrhYgjZf
	yfWUVqMSpV9zere3l6ZpI7kjRkFXd/83ZnSK0ahwfd3zPEMJkYGe0i/JXF133Lfa
	K6MUpoUVudt2lcS4g66fQ727J4W7F8//AgYst2sOn4/POa8NrAUGS6f3EaHujq/W
	9D/svih1YQd8nqsdXi/NWL0qL9qzJ++R6CWmswX0P6g+EuLA4pnonDCwbcNRw0Wi
	qqeIjvTY1wyC2pVOaX7X469MWo5PcfuPUTvfhnhS0hRDBD5o+HYCxs24XlZLqqJa
	QoIErxUERH5WDlUcDag18u6E7QyU2QALE/RHCml2nChTfmZW+OyfrkVPj2UV1C7/
	e0BiQQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyhubgmhd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 08:26:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93c5d7c4c26so442757985a.1
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 01:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790583976; x=1791188776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jaRIHfyS839pnGmtubgjSGEcFcrMTPnSFxHKmD/d3ug=;
        b=LTtC32Ev1XjhiUVZHtlSIeDBAhDjWTO/IMPr4ZO429Oqqt3EgqpeWKVHkZ+MpVcsEx
         X9ao/NRt0RLRDfcatd41PE/KVxFATu66Tie8N/BKFXDQseqCZyzhWnt0PpDI1Ivxbxfg
         Y+0q2fdRzZhdyfpPGxVjqsZxjlDY/oL8x13wznzApv9lt/wUMAyXwYoBtOtkjxzBkTlX
         yOo37zXlmA84EeSmLq5x9qpxsLjz8BMeNhlMALn29jBbapDcjbpSBBPWSCBa5pPSceqe
         0j79HpiZX/ZiulkhO3AxtinUjkRHfeDsfqcRg+TXxWgPR5dlKRD3TzGEFApPjaUl2BY7
         Vb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790583976; x=1791188776;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jaRIHfyS839pnGmtubgjSGEcFcrMTPnSFxHKmD/d3ug=;
        b=KEP8Vv6yEG8iysDA6+hEJ+11w49AaUYQmtdv0SL8rpdF3e0GY61uQmgNdeOeipCs1M
         SNNARMH8F8KaS2nsDdWmmKqwoJkCs/HrgDGmKUbSlfxWtYOakykRgsZKCOXcX0D4InPe
         320yeoyTT1ZaqKODqMyvSnxcZSlWV6uJozVR7ZQ6otjgzypGW0vDEC2KgE8hQ48UMDGB
         Kx+ebBIpSQ/CF3ArxBYp8U/ChXKSRy6M47x96f9PHj1gQPsgl6cLDBfEJgJBF3GsFGLG
         dUC0KTO4M4AtuOznPCM+bZ83dcVbKeffCAgqBDFhwPFDHnnv8JTv7duCkzQcNV64ZjPR
         xQHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwMMmekowk2gpisgLXLFn61lKsx31p5hWqWCGXwOrZti6rqS8rAnjtRD/xBc1rdImxeBA+W7AuRiWB@vger.kernel.org
X-Gm-Message-State: AFuF++nL1dv8jpX6t2TUL8M++OFFe83G0Nlzy8crjvw7YEsVcazJgPs4
	GpxguJZPnDqmqXE58rxoMx0ciP+T04k0Y9e8ETMkjwgH8nBZp5iaX8PZ+aDoDV+85fM7oCJq79L
	pd7Uz6XoJlqotAC1SpLBB7oWftYONQHN+DHMY60R4adpOtacYuwUWvYxZknTZkprDvnz11WiS
X-Gm-Gg: AYBFou0uQeDC6d9fOl1D579k1WNEiqFu3d5f29KraecIUFCvs/t8l3wS3smSTiAqvSj
	t3a9T6MjlZRJ3y6LAM17Jgc+feDkuJjFdgRyy9vEP+TUP94IQcPNSn03q1voxDlBYVYxWYrmJba
	HErWWFqlWZL611aqhzLPvCIvAJp4jCOx1rrkW0XNDJ9LFXbx5cltTYskwlfVmMMOUAwd+TYTlDj
	qmI5hTYZ/nL1la71vkbxyhRV3MyNQneEaUW65SCEJJFNkejloBdJ6ihwsvSdWBuvkjY4PdOqNPa
	7S/+p4tk+86GBRYULYReQNr7tMkPqqcT7jSYDnMuZedizAM/RQmnpcOiBSMcxTavAD37Tcg/xJ1
	wur2TeNDdHI/F8r5GI/P4uu/yO9c=
X-Received: by 2002:a05:620a:4381:b0:93c:7955:afd9 with SMTP id af79cd13be357-93c7955d94emr530358685a.52.1790583975987;
        Mon, 28 Sep 2026 01:26:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4381:b0:93c:7955:afd9 with SMTP id af79cd13be357-93c7955d94emr530355385a.52.1790583975552;
        Mon, 28 Sep 2026 01:26:15 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d5f4:8a0a:ffd4:396a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm24546686f8f.35.2026.09.28.01.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 01:26:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>,
        Prasad Bolisetty <pbolisetty@axiado.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
        SriNavmani A <srinavmani@axiado.com>,
        Karthikeyan Mitran <kmitran@axiado.com>,
        Michael Walle <mwalle@kernel.org>,
        Petar Stepanovic <pstepanovic@axiado.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 0/2] gpio: Add support for Axiado AX3005 SGPIO controller
Date: Mon, 28 Sep 2026 10:26:11 +0200
Message-ID: <179058396966.15719.5627642110789688777.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260921-axiado-ax3000-sgpio-controller-v4-0-79c444be7faf@axiado.com>
References: <20260921-axiado-ax3000-sgpio-controller-v4-0-79c444be7faf@axiado.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XKRhzlJos0A_6OXJR2d5ORhKnAQGQUeJ
X-Authority-Analysis: v=2.4 cv=C7F8WgP+ c=1 sm=1 tr=0 ts=6aba24a8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Wkxt52mgQ5FUUMUmAjQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: XKRhzlJos0A_6OXJR2d5ORhKnAQGQUeJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzMyBTYWx0ZWRfX7U9n2wFzD09c
 6bAifmIh+Y2CoCZ4x3A2/NRqp5xJtRWjrG9v3JhXcN9hhCOK084eDn/J+rSINaZ594n1q1BCC9k
 SIgHmfcoF/YeXD9Ixt/c/kY4GahTAXdihpaJ5H2RUsHnzKMVxJZyGsT/PEuCIX8Pn6NwP1AaHn6
 qQ54RzwJN8g9/hGUNks5r+udtFdF2Bc0ZaViwQ/sHhYoBkIiQ7lyTjoxRufOhdU4S/1icai1fbF
 Ubfog1D3mT5z1DixbUkuqUJd6L6sga08lGn+ABeAxUPLGb58pFu9QKbCcrs7EHznczyoaJaEGeJ
 kriJNlxTZnUs7BqT7Az1W0T0ApzLmrYRTgM/yDztHtpMgIYYCgH9iFE3B1NDE/6ycYOF0tWwCwr
 zwMzkP8png8S5obAZpnKavWs1q/5xNHgDFa/NX+pjVmcKtCgXVlDL5u+sY6jABZ6Vn+IHaFM/w+
 E5FUS7ColwssnQWi+2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzMyBTYWx0ZWRfX63tzmS3CMgvz
 d5AHTgrd8TdpBz1VII6t+Fk6DUtu14W7r3v6/kN7q+xlYrifgwEJSTG0RtD13XnE4Y+vzomeVFn
 ZWPFv9RyLISjCvNY5gvSIa4ag8aMXc0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280033


On Mon, 21 Sep 2026 00:20:21 -0700, Petar Stepanovic wrote:
> Each SGPIO position provides one input GPIO and one output GPIO with
> fixed directions, along with interrupt support for input GPIOs.
> 
> This series adds support for the SGPIO controller found on the Axiado
> AX3005 SoC.
> 
> The series includes:
> - Devicetree binding documentation
> - GPIO driver implementation
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: gpio: add Axiado AX3005 SGPIO controller
      https://git.kernel.org/brgl/c/a7787b818204d6de78e2e83ded0155d8195119e6
[2/2] gpio: axiado: add AX3005 SGPIO controller support
      https://git.kernel.org/brgl/c/dd36a4b7f391eec4daa336c837a197dab0cf6401

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
