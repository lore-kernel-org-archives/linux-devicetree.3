Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794381021;
	b=nzCTgosHA1lvOwJwJIpafD/dot90G07yYeQJqGFS36RXFzlOOhZecRuabuvKThzqDwJ/
	 qFd1tGpaK/UlK/Hiu72/rE/Mj30mtQLF43oJykeD5Cm3pcTLbSOALq6O8Skkz9XwCi/UJ
	 LfVvUUXFxFvBr2bqadeMVa7gp5HXuWhpLzveFp9k2YuRMyO+3LRTw3eeeAt9F0iM8YnqM
	 hMEmjvRrdUKol4eLhqzx8FATHUwjy/CFFJkz6nMWGqo4WmNv3iU0SIYCIqq8wULYttHLy
	 m81ZwJM680NPMX5PwKFfhN7D9c/L7CE41iyTEu0xy5Pe5GtJgNjWj+gRftPLRcQxeug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794381021;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 X-Google-Original-From:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=W3qNx39FMf1BOTjwvebsKoIWWMVE5mBaCfEA196G0ts=;
	b=ntFRs908a/zEMbR3AnHqo9lz7MG+kPVlcxIelxLtPp1ZH5VebhgVGCVAanaY/CMgrjFA
	 mP9C38rOhR91ZAz61vw0daSeQR6wq4DA7IVFPhWkGgwn/gdPS8Rgz6znR59mxJCkWEBLM
	 63mGe8CqZ/UArAU+PGE1en5GtjG7c+RaNLeVHtV5y5TMEFWDeHW4Y+rPgbS+nH/tAv30D
	 6tpm9KQ7gsiJ80FDgWnFVXkPJ7D1SKI3D0B80k5QGIQxwP0vpqG9bU3Km7SPZAjzqyyBu
	 FaPmwmFxsM/IfLtOtFKZ27vrW13HuUPETounvtleNeyjnqRVy94/VFt+WTFV54JsQQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oFND5jF5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OUGMh8QU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F70B606A31C
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F70B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oFND5jF5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OUGMh8QU
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KRdF3959068
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W3qNx39FMf1BOTjwvebsKoIWWMVE5mBaCfEA196G0ts=; b=oFND5jF5muk5SSG6
	x9JOIMx9x232dA6O2ATNkn6sWV0UodJv1+B2e7BRi/puHKK8AUR3TCKzZSGtSHU8
	9svUKvzTsi+LNIBpG9WUmauSZVAz3i+BsmJrYHCyEeM/hFW/FH6qgJ3hgeWL35Yv
	uEftjHP0oJPJe+MDww6tHw6iOIcKMTigexvq2AeX4u1fK6vZzGdfnQcYXYTePa2I
	4Q0VtRd+Bvs+LivjFQxX5QASU/L4lovBjKv13Z4D++PI7GQCuH3Ajy6p4jxbeOD8
	i8JlOF6Y5oHK1md08FgF+fpfAeasxFiVwtIyzC3O9rDt6zLdXM/3HCe5kkA7ymTg
	ak0HgQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b32byv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:10:19 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375f0fd31f4so1677014eec.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 23:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794381019; x=1794985819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W3qNx39FMf1BOTjwvebsKoIWWMVE5mBaCfEA196G0ts=;
        b=OUGMh8QU92igMJN+j6348pMjzbKZEJVdC1bAUubEBZAaSb/CcM9ImEil2aOFdxnlnP
         Mruida4AgLaKfJy80n5i+lPlZoGwJrT4tid8ipjhuoQ2BN5q2Xs0fnsLSLoArTBPQ7HG
         r9W4f2HoBgmDkeb4w/v6Xd2hWmIKnP+YnurR5pM8QzPzzQZV+UdW9JmlssXUt+I3r/9k
         +ZhaZ8J1sgS5INCO6wi/pByCibkWrOZ+kvzrCzkJNrf+kbZMv8p6OZ8Uktr6Hul3AN9X
         ser7Ww0tpi/V5wfOSohrPGFxAaj1jO09DCN+FH+/dgHLYOElsiKimEgkGDfwvQRpCa9o
         HdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794381019; x=1794985819;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W3qNx39FMf1BOTjwvebsKoIWWMVE5mBaCfEA196G0ts=;
        b=TioW+9N95GLxjYhorhhVMFCFOFGBgGCPx3UgMDByZlwfd5dOPirMu89K0paooDs+Kt
         8rVb4XRdpcCGIsCJd+/6E3e04gczB2uqu7E/cBOIkCJFMSSjk7YvQ1WJlkn9Rq3/a1jQ
         0iy9kUNOGd9v48lnOVi5yuQVEO9rJ2g2sksV1jAMdzH1ihf7JlwGXgu4tKTSbPFLz9jf
         8lGhbG2uq34eqGKM2/RRiLnAOTVWs1Kf4UcHDn+zR8lSG/06WztzVM8jKRPmjpyMFtwG
         Lj0w8tlCYNU8DF9GigVHITipmVjCqvFilMriDBUe+QKsPsB4+MXx4cM9QAONmXUP20oL
         Lgew==
X-Forwarded-Encrypted: i=1; AL+hErFI9R7dwkF+oW2283JKIBuRm/+5Z3ktwJLvoaRcz2B5cOFV1dg+vljM5Otw7dAdYjnjxMf1zP6PbCna@vger.kernel.org
X-Gm-Message-State: APuU4Z+4LMXR1vTVJcMIbSHf3QSQftGnNMSvRmtIiRvI4GBs2EP4Y/Li
	OFoHmY/KmudgzKKynGDOV9Slpat8OwrCIOZujan2CvHxm2c4ek92+3zkx4KG+rPUnJRzLsVDsVQ
	U1GbtXD+QesIkFUSOPP/gTSHi6rKdobqT9SS2fMMLUEyYjCCG2CtJYoA8OcdhY7YA
X-Gm-Gg: AYBFou0cQKkKr/96ugMgVhXFvYy0n68dWNcNlwntqdU05Gt7/UZe+yYFcCnhbp0b4i4
	PMJUS9Sdk/dHUCDB5pIqI8MX/0/i3e98QuSN2jbDIMfEI0pg5HfelgH0UxD4y4ObaPHoJ0eIdvv
	uF2pi+CGHuAEtwRZKhASHMCRl0Vl/SLzhgpthKNiBBkUf4xr3lbDtrfESBy/7QnPwnCMGOHRI1Q
	qkt5SkOipp37Z1pgjApYjMBzVSRHJLU0z75iIhxKM/0JkYiCLAB9B3cMDSi5k/HvoPbAjBjH8lK
	LjqNrAoLSTPFyu0jLpNbV+ROgongFZSZXt2u6hE5cm3VAZE9AURjNDkusfrE+EvVZ86wDggsBaM
	1XF4Nx7CGl2f8F/N/zGHbMHp8M1AEK6mSntFiDreR6nRto65CHgpMK2QH4LOy9uuUd3Nkly5lGr
	FKjYql/XE=
X-Received: by 2002:a05:693c:62c3:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-37687119518mr1917686eec.38.1794381018929;
        Tue, 10 Nov 2026 23:10:18 -0800 (PST)
X-Received: by 2002:a05:693c:62c3:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-37687119518mr1917632eec.38.1794381018145;
        Tue, 10 Nov 2026 23:10:18 -0800 (PST)
Received: from [10.204.79.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm12686718eec.11.2026.11.10.23.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 23:10:17 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Google-Original-From: Jayant Shekhar <jshekhar.shekhar@oss.qualcomm.com>
Message-ID: <2fb9fd90-fac5-4a9e-ac7e-5dde689d8b80@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 12:40:05 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/23] dt-bindings: display: msm: Add Qualcomm DCP
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: iommu@lists.linux.dev, Abhinav Kumar <abhinav.kumar@linux.dev>,
        Simona Vetter <simona@ffwll.ch>, Robin Murphy <robin.murphy@arm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>,
        devicetree@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>,
        linaro-mm-sig@lists.linaro.org, virtualization@lists.linux.dev,
        Jason Wang <jasowangio@gmail.com>, linux-kernel@vger.kernel.org,
        Maxime Ripard <mripard@kernel.org>,
        =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-media@vger.kernel.org,
        Mahadevan P <mahap@oss.qualcomm.com>, freedreno@lists.freedesktop.org,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Will Deacon <will@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Philipp Stanner <phasta@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
 <20261026-jshekhar-dcp-hlos-v2-1-7cf014efdee1@oss.qualcomm.com>
 <179304379330.2965544.11793708430519844335.robh@kernel.org>
Content-Language: en-US
In-Reply-To: <179304379330.2965544.11793708430519844335.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af414db cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9TjDuG0S92mpM2z4UZQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAyOCBTYWx0ZWRfXxgzjgHgGY6ai
 J7nwUa+FPYNhu0+bZ7KJ8mLhhgAKQQH5cVlPOEICzIs/G/9rSY/DPHzt8m5gi6HLUZLES9ZIDLz
 OSCYIpz91wvtL3oUw38LSfiBjeSK7RIBz1IjQeGN9nen3gFiBjFGra4B5DNNhQMa6hD+nkbUJrS
 A3ZFoJGSzpZWjbC2rMmE80wfi/Q2eEbQnyoY7KklBYbVcEJjvoHVfYQXP+X8dGSINcPIZ4g8ZU0
 DLWZKGdeXwJCHxUpA70OKd6wdreqGWsKO1buLblnvJOGLA1PEb/ONExxqgydSIhjGoH6sVq4GJZ
 o6I2cQ9IPD9btAo37lj5AQSCoUXTDcXiRL8njmIAyo1saePByg6m6HYZGi8Vd1pOwAoQ5NGFnL9
 UuXFfvOqGaDL7jRcMZ/iA3YH9wMa2+hWGvtaFF8IhXLXTgwV27R3n0OjVNb6kTGpbvGZhp/W7vU
 IA9V58liuyUp8ZXiPsw==
X-Proofpoint-GUID: ya84rbFprY9JWfNQyjc01cW9x0qgGDd1
X-Proofpoint-ORIG-GUID: ya84rbFprY9JWfNQyjc01cW9x0qgGDd1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAyOCBTYWx0ZWRfX3PV2GT/kRk6d
 26GyN0nlHQeIY+LtUgL01zadjuFkFeRtaRaF9h66CGJ6dMeINEOvhPnBb6cv7PER5NhrInfUUdX
 DKyI0LFaZgdLaf7oX6qsNddqRT7XgQ4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110028


On 27-10-2026 01:14, Rob Herring (Arm) wrote:
> On Mon, 26 Oct 2026 11:51:11 +0530, Jayant Shekhar wrote:
>> DCP platforms place the display pipeline under firmware control, so Linux
>> cannot discover display resources through direct register access. The DRM
>> driver therefore needs device-tree descriptions of the Qualcomm transport
>> wrapper, display topology, IOMMU contexts, and panel connections.
>>
>> Add bindings for the Qualcomm DCP transport wrapper and VirtIO display
>> subsystem. Document the IPCC power-notify resources, transport and
>> framebuffer IOMMU contexts, firmware-visible IOVA range, INTF graph, and
>> DSI panel connections. The wrapper creates a standard VirtIO-MMIO child
>> after the IPCC power-notify sequence has completed.
>>
>> Assisted-by: LLM
>> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
>> ---
>>   .../bindings/display/msm/qcom,dcp-dsi.yaml         |  79 ++++++++++++
>>   .../devicetree/bindings/display/msm/qcom,dcp.yaml  | 123 +++++++++++++++++++
>>   .../bindings/virtio/qcom,dcp-virtio.yaml           | 132 +++++++++++++++++++++
>>   3 files changed, 334 insertions(+)
>>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/virtio/qcom,dcp-virtio.yaml: iommu-ranges: multiple incompatible types: uint32-array
> /usr/local/lib/python3.13/dist-packages/dtschema/schemas/iommu/iommu.yaml: iommu-ranges: multiple incompatible types: uint32-matrix
> Could not decode node virtio@9be8000 property iommu-ranges with value b'\x00\x00\x00\x00\x84\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00'
>
> Traceback (most recent call last):
>    File "/usr/local/bin/dt-validate", line 8, in <module>
>      sys.exit(main())
>               ~~~~^^
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb_validate.py", line 443, in main
>      dtb_diagnostics = sg.check_dtb(filename)
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb_validate.py", line 331, in check_dtb
>      dt = self.validator.decode_dtb(f.read(), decode_errors)
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/validator.py", line 631, in decode_dtb
>      return [dtschema.dtb.fdt_unflatten(self, dtb)]
>              ~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb.py", line 591, in fdt_unflatten
>      dt = fdt_scan_node(validator, fdt, '/', offset)
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb.py", line 320, in fdt_scan_node
>      node = fdt_scan_node(validator, fdt, nodename, offset)
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb.py", line 320, in fdt_scan_node
>      node = fdt_scan_node(validator, fdt, nodename, offset)
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb.py", line 312, in fdt_scan_node
>      node_dict = node_props(validator, fdt, nodename, offset)
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb.py", line 258, in node_props
>      props_dict[p.name] = prop_value(validator, nodename, p)
>                           ~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb.py", line 185, in prop_value
>      if len(p) / type_format[fmt].size >= min_dim:
>                  ~~~~~~~~~~~^^^^^
> KeyError: 'uint32-array'
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.kernel.org/project/devicetree/patch/20261026-jshekhar-dcp-hlos-v2-1-7cf014efdee1@oss.qualcomm.com
>
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.


There is a dependent patch which adds iommu-ranges, I had tried with 
that locally and it passes.


