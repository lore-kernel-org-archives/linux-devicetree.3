Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C952EFD9B
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 13:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782395035; cv=none; b=s+oMcPExfzu4TJIFgauIDJCD+HGFHA+CbVGPj97oMdWaZUtyGE4BbFUVM35FbXGri4J4tkQSk6QLQU5pkZ+ynMbC/cgnaumw7z7TIL+WtZFiH7XS6zTgp26BaLkjx01iTzc4LAqnqKIZxo1N3hV4iOE9UbFd60pqVAyWGBXmyxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782395035; c=relaxed/simple;
	bh=ylnoSG5Un0ZYdcYuC6dnhdYGCCCntf7xa274R2xOL9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hGXrtQ+vTKU5eFHz4dygZ+7BjHl6fmM2ko+UuhL6PnleZfauxQpHeehrGWwhjY+1A4ZEQ4B/H0zQCpbur1e0wPYLImuFyHPQgdHIuqaJoDn4zrgsP7NKFrn6+vKgXqIayEKuQ/5N/lEN42HTnEpPzJzZa1sXzE+mvCDtQGvFRc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tx/yzU1A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XOdb1acT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tx/yzU1A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XOdb1acT"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9jsYV3077193
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 13:43:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lnu1e7ij8lVAgXLYu6foVJHm9q1pJayOQFxmbxoqCb4=; b=Tx/yzU1A6IDpcdD0
	gMthgJ41kWPqh8/q8ihQYrN5vwMwXu2jehAjangwCng60pA/mL1CjXgZ3FCm4xxC
	GIO2W+fZnXmMSW0p3XQnIKlXjEKrN1yu8F5oX551+5eHCc/0RBLO/cBVk/uN4EQp
	AlgHJYIFT7Amssx9qP/mp5S15MJz/dd8luXcUU0sK01Gw6+bufjwnuGpFpO59Avh
	MxdRuiDyJEz3qRJJliSObfWo4GeP8og+oOne8AmsgCZlEVG8Y9nRPuGHgFwH05NV
	qjlXEo1aMbsxmpmBrTuWNmmbKh1B1Hio9Dh/fmYkgN5Fn5yu7P8WR4GlLR5csGMh
	i1r++A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0yynsd4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 13:43:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-926e8e6592eso373141185a.2
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 06:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782395032; x=1782999832; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lnu1e7ij8lVAgXLYu6foVJHm9q1pJayOQFxmbxoqCb4=;
        b=XOdb1acTyUGOR/GVJn6hSczp0tPRDtzZwJblT0ldu/5F6pIrpvFudIIJ+LTJma9yQO
         wXK79nLP3J6lhko0D6qVKlhfMcSdPdKnFZg4Qz4f5eVOM3lNHuVlP+90qhUfqAlEkKrc
         1YOj/7VtYzQOyNOVZjNgfUcoGOFSs/V5beexVmcmfuvznT+zl/Vx5/Vg1Cm0vMS2AGbV
         zchu0KQzAv8VtIa7z/xdQmS8w+iMO7P8ThyNp2UXsKPh5vDmRNMaPd2UcX3F9uebcsqv
         gPQa633JuKVaoV6nJPKquY6YZLa1a9s3hMlVq0QV46aWFldyV0VuvgSObKx2LqWPzuzq
         Ccdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782395032; x=1782999832;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lnu1e7ij8lVAgXLYu6foVJHm9q1pJayOQFxmbxoqCb4=;
        b=ccz+e5ojfFwDxvgxL/J87+rHyCPlKxVMnRnch5iMRhk+/evtnT9ZkGGoP0xKLGolzr
         px6ABZBZGjrnyO34DEkHnIJu7hbb0a69ConWLT47Rs0daliF/PKffywBXqwWwoC2fThe
         CR2ZOobz7lqpUwaORODf0hHf2pKnOKWhDcq5J8VE1CiXXJP2QuIWTkV65Sfeyzh9srqT
         6BpWLiJY7Fg0MChAaAfxm2mIXHIEcBqMt+/uZNjmVDeQcP4VW5LgZcZWBcmQ/2JEHSDh
         Wk2xHfW6AYrt/1w4bLrYS8ZiC3p5YSbE2KrGfTOU8E1ha45bV3MwwMctN6AFwQjhhHPw
         eXLg==
X-Forwarded-Encrypted: i=1; AFNElJ++br/dGySQ7xDMa/2gyPvXfFefmFOO/K9OFmcxogYR+ZpSTrXEl+vhwaU00lD5P7Dbe/HDGq9GgHWx@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp5OcNuwYlwcaHiCsxwaaMg0G0fJaSzy+VMhSDQqCsUHbxBZ6i
	eBhTK2WjOoekKXqNKQzxFWI+11kW7o44ZHKTVUKEZPcCk/Qfw4TFEEv40aRA4dwtQ36TdfWvPPw
	DvMwLO566Cv4s3QfUS6wRgqZWINHqlhWd5KLGiwmqVUzIo68sknPvnRnIQ1AZmGD9
X-Gm-Gg: AfdE7cnhSwInHWJCz86okzYxnn0BibETl4RDjsX0pVVUhJRNx6uMGd24bQ0CZ8cvLdn
	PmnFjZcujtWj2z920iZBFfcETuugy4xotyw3dVVtN+913eibjYuDoPIPtkubJ0/ung7FeuU4YA7
	tJbMcgohoFsMCKAB7dMATbYw+0h6ArJyVTGF9IyLxjkYBiSj2UDVfajsrTa74J6R2+9+DeN2mBO
	2TzVyoR/9ctBHClhRRgdSRrr7M/ciiQG8BvsTJtfGygMUB0p9poXFYW/xP4swNEzT2Z8rSsprYs
	oaIw5+iE5aICGP2Jqoyf8uXo+OzGTSzmxD36SB/lPnJobu0eTAv9Eo+c6/aJF1cRCIiu3ZJGBSM
	ERihKvfdmv9I6dGSfR0JSxhh3ezaX6rWIm5+xcJBUsi8=
X-Received: by 2002:a05:620a:3710:b0:923:5e7:1664 with SMTP id af79cd13be357-9293c9e820dmr378642385a.45.1782395031811;
        Thu, 25 Jun 2026 06:43:51 -0700 (PDT)
X-Received: by 2002:a05:620a:3710:b0:923:5e7:1664 with SMTP id af79cd13be357-9293c9e820dmr378638185a.45.1782395031413;
        Thu, 25 Jun 2026 06:43:51 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c120755d053sm115124566b.15.2026.06.25.06.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 06:43:50 -0700 (PDT)
Message-ID: <364a79bf-e424-4237-ab13-18e38299ecec@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 16:43:49 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] This series adds support for the Qualcomm JPEG
 V4L2 mem2mem encoder.
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org, bod@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDExOCBTYWx0ZWRfX+okQFrBFlHTs
 eSwG24lGLdVuWduRwhSphvKaoPEKnjRcK1nOOOOs7rVUreEt4sBaL7AIYAbOqNxZJFsVqBi67d2
 CX/TMTuo0nQvyz0cLwodgoUqx/THe95c3UXQDLchlxFWTj01B9TRIL1MRdRR5YUTNSrLpewkWIG
 fMLo5WZlBsOzB10/Pw5+ZnyM+60mMFimUVQAtAVA9pN1IrD7DFqRR8DPq7bIMzLJbLqeNDdoHOd
 gR8GQqxhSS8UnHY3p7krU2IHa14Hf1RHftsz+YiGHtHlUOZ3xIMLiBnFGnbfrSmRsRBjXH/WFZ3
 THpu0SjcBVJCIbj0Q3WyHraBq2xtTp++4HYT8vbrr1NwubjMWXyKg9QT2MCRMyMcH/S1m8TQxjF
 gqZaS00G8Y5XaE+dnyxJuPKMcmq4SZf/ljWcIyAtxXhybMYMVCSQaKyrr3kNSfrgxy34xX1RpGo
 5+qDwEsLkz7zCpRSClw==
X-Authority-Analysis: v=2.4 cv=aoyCzyZV c=1 sm=1 tr=0 ts=6a3d3098 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_FjdycPTHN9gxW4S0HEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Q19m20IEw070RJPAGSre3fsT7fSEJ64_
X-Proofpoint-GUID: Q19m20IEw070RJPAGSre3fsT7fSEJ64_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDExOCBTYWx0ZWRfXzRZgimZXRu+O
 RV9Jpe3HTG8RidNRbECHvqnz2J+42I1k/GBi5UAQ/OnhYKaDfQzeQrTl18udy3qaVnEttah78D4
 A6lublnOjFSh/tKmmTh9yV7VtaksjAA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250118

On 6/12/2026 10:44 PM, Atanas Filipov wrote:
> The goal is to upstream a standards-based JPEG encode path using the V4L2 M2M
> framework, with DT-described hardware resources and SoC DTS integration.
> 
> Patch layout:
> - 1/4: devicetree bindings for the standalone Qualcomm JPEG encoder block
> - 2/4: SM8550 devicetree integration
> - 3/4: SM8250 devicetree integration
> - 4/4: qcom-jenc V4L2 mem2mem encoder driver
> 
> Supported compatibles:
> - qcom,sm8250-jenc
> - qcom,qcm6490-jenc
> - qcom,sm8550-jenc
> 
> Driver scope and design choices:
> - uses the standard V4L2 mem2mem + vb2 workflow
> - maps runtime resources from DT (clocks/interconnects/iommu/etc.)
> - keeps userspace interface within existing V4L2 JPEG controls/framework
> - uses runtime PM for balanced power transitions across stream/probe/remove
> 
> Functional validation (hardware):
> - platforms (codename / SoC / compatible / board):
>    - Kona / SM8250 (QRB5165 class) / qcom,sm8250-jenc / RB5
>    - Kailua / SM8550 / qcom,sm8550-jenc / RB5 Gen2
>    - Kodiak / QCM6490 (QCS6490 derivative line) / qcom,qcm6490-jenc / RB3 Gen2
> - validated SoC coverage: SM8250, SM8550, QCM6490
> - tested flows:
>    - single-frame encode: 8192x8192 NV12 (v4l2-ctl)
>    - single-frame encode: 1920x1080 NV12 (v4l2-ctl)
>    - single-frame encode: 1920x1080 GREY (v4l2-ctl)
>    - GStreamer NV12 pipeline to JPEG files (v4l2jpegenc)
>    - GStreamer GRAY8 pipeline to MJPEG output (v4l2jpegenc)
> 
> Known limitations:
> - scaling is not supported
> - width and height must be aligned to 16 pixels
> 
> Atanas Filipov (4):
>    dt-bindings: media: qcom: Add JPEG encoder binding
>    arm64: dts: qcom: sm8550: Add JPEG encoder node
>    arm64: dts: qcom: sm8250: Add JPEG encoder node
>    media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
> 
>   .../bindings/media/qcom,jpeg-encoder.yaml     |  142 ++
>   arch/arm64/boot/dts/qcom/sm8250.dtsi          |   35 +
>   arch/arm64/boot/dts/qcom/sm8550.dtsi          |   42 +
>   drivers/media/platform/qcom/Kconfig           |    1 +
>   drivers/media/platform/qcom/Makefile          |    1 +
>   drivers/media/platform/qcom/jpeg/Kconfig      |   18 +
>   drivers/media/platform/qcom/jpeg/Makefile     |    9 +
>   .../media/platform/qcom/jpeg/qcom_jenc_defs.h |  244 +++
>   .../media/platform/qcom/jpeg/qcom_jenc_dev.c  |  336 ++++
>   .../media/platform/qcom/jpeg/qcom_jenc_dev.h  |  107 ++
>   .../media/platform/qcom/jpeg/qcom_jenc_hdr.c  |  360 ++++
>   .../media/platform/qcom/jpeg/qcom_jenc_hdr.h  |  119 ++
>   .../media/platform/qcom/jpeg/qcom_jenc_ops.c  | 1658 +++++++++++++++++
>   .../media/platform/qcom/jpeg/qcom_jenc_ops.h  |   52 +
>   .../media/platform/qcom/jpeg/qcom_jenc_res.c  |  226 +++
>   .../media/platform/qcom/jpeg/qcom_jenc_res.h  |   54 +
>   .../qcom/jpeg/qcom_jenc_v420_hw_info.h        |  529 ++++++
>   .../media/platform/qcom/jpeg/qcom_jenc_v4l2.c | 1109 +++++++++++
>   .../media/platform/qcom/jpeg/qcom_jenc_v4l2.h |   25 +
>   19 files changed, 5067 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
>   create mode 100644 drivers/media/platform/qcom/jpeg/Kconfig
>   create mode 100644 drivers/media/platform/qcom/jpeg/Makefile
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_defs.h
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.c
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_dev.h
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.c
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_hdr.h
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_ops.c
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_ops.h
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_res.c
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_res.h
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v420_hw_info.h
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.c
>   create mode 100644 drivers/media/platform/qcom/jpeg/qcom_jenc_v4l2.h
> 
> 
> base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d

Hi all,

Thank you for the review. v2 has been sent and addresses all comments:

https://lore.kernel.org/linux-media/20260625133828.3221781-1-atanas.filipov@oss.qualcomm.com/T/#t

Regards,
Atanas
