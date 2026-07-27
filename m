Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3B63BFAE8
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 04:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785127474; cv=none; b=Wh9HtRxNOTypiLKm3kGtuf2hfuqphRc00duPF6Chb46PQGAXTg36aWMQsMf2nT81A5fcllIkAKbIGJyO9weVjT0GidMDv8xYuJZoNZ7aKkPJUJhNH/uk4Ero7Igp1n/1UKRztXC0/L/u9m6hpxRDlvedj18QJCk9cL05e22wxAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785127474; c=relaxed/simple;
	bh=iuXIPrSwCRp0iQ6GB/KRWeEaz8D3p/6oRtOi4qeDXfk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QEJvBZDlPGohG9dEajH0cT+4VhBIOJDhUwUZ+tdY/LlaJD1JII74W1HGEdSAdbH36eQ/WfEcPJdH+libZrQzJ46iGAq+8/7iSqtU2SC6Ha8YMV9uRpjCz7jTgLFap28qQLWW12HV5E5SehvRGAFWqtwU83ujTvgh27XxqEDG4W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dAHkttkM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=elqlqPmC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dAHkttkM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="elqlqPmC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1flXl2417539
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 04:44:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+wcb+8A+KwRe2Zf/opdn/X7rbD+wSNt1gfOSQD3ASyM=; b=dAHkttkM2rGuUv05
	FSsa6DwSKWh1Bmo6KC9ZNmi0RjxHlGNhhZkKKlS9zO8hpokv7fq/51RQv8iiEuSS
	JKDl/eSb8Mg6T98gTQuGgIFH6z8Kw+HzvVOJlO8HqPjBfVrwxJ7eCxTgdq8hvLNM
	lSquz5S+YF7vDZCnyMgZxrEfIvyo3Rts3wsRYynMc0lFiVCYdF8cSOMWzJX4U5xr
	XJ80GDIzIXnZDan/W9e+SGsXT7fpuUTMyRHExMWLafWSgZ/ngguv/cdLGxZ3Fq/H
	apHn5c2vVP3ThgbqaRNaRSsL1jWhYF3vbaBidjebjlbekphMpfpoWqT4XiToxfbk
	RvL9HQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fngyssp8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 04:44:32 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb7049fa552so1444716a12.2
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 21:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785127472; x=1785732272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+wcb+8A+KwRe2Zf/opdn/X7rbD+wSNt1gfOSQD3ASyM=;
        b=elqlqPmCbL9j1Lu8LK2z+M/7J2/bFdrSjVspFFLyt+q3CfdB+e8tHlohHpZmqnJYRf
         CeokIVYbg4Sdl03nx/ESF0go2UC71tj33yEOTdh7rYi+GO0SrbqyEAU7NbTNbVt1kTSz
         QDlFwOh98YTghF1RFh0STkMwmdk34Hl8Mri5OlE+D8v6CkVgf4bbjp0PjT8ncB8GASTe
         7IEjbhIDxooSnhaoq9UiB5j1QiO8IjkzikF4utB3aHGEp3Wnm6RfWRVo2LvAXzfEoz7g
         ab+yAwUET8Tx4cfrZnT6sxEKBIRSPwqBEeySW9W82BGRcn3oupsXBxKkHB26Y6Sde1I5
         0U4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785127472; x=1785732272;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+wcb+8A+KwRe2Zf/opdn/X7rbD+wSNt1gfOSQD3ASyM=;
        b=AxMaQh25ylp4RN7VdruXshn0P5ZUHjGpOy3Q+96hT5RsrTZ8jqZzk+GckuaTlBxrgH
         8ndgrcnjZSkrqpm+QV9TloTV2nVpKFUMUsdaTK4ZBjDyrldO69gmZ86R1sOJEIDCle6s
         JWSu7M29xj6aPxcTomuQTZYO1s6ZJSe9suPr5NbVhBDxht3wIEZKu0XrbnKaharxSAv+
         WA34ufCjh0s/LlxWNvYwnKmkzKHWxHPVbRtr4/gENQx1jCShEqoR8oJjM7F8MJgql1O+
         K0GXMTeVuxVe/jDTONNSrdmTzXIw4kDojXolKwc1i922BiBojXgCoNZ3IioFlK8lwA+l
         6ALQ==
X-Forwarded-Encrypted: i=1; AHgh+RoT9GRmkdIz2rZoUmgmwt8m+63iCZQbPo146NwAefdNQasRs8mOV/iZ7XU3byXL6lJLKU25shXqRRl2@vger.kernel.org
X-Gm-Message-State: AOJu0YzlcviE8IQ6Q+fPBlAwTkzijFW32GD7qlnDnN8uJ+F26+qJsDkT
	v+eh/JNkDbZoIC2Jrn+EJJ54dXh9eX00iRNPXusMnXlL2tEL61ezPfbh3hBAcR4MZs4A3jAD4nR
	pm2kcwM6iBLGRr161+W12TSbcPjcYj1oaXS2BaXnIGZziSuB9up5OEPmKTE/ehJAfTGqniwj7
X-Gm-Gg: AR+sD12hrrMcEGSiL/gz3PkQtTvK9czWMhYDq8++Pnitq14U06qAhNYmC5JcHNP3LN0
	1QkPFY1Ko7Tx9ZDZuhLokftUa/VBEaJIVg8rTnsSP7Uhkc1ir68pb361/58ClN2FTjiDRXuwBAh
	T/xqgboBh3Wz0x1yrZZXKhLmrf6qwG50lAcT7duK2bHo5GHfAQigfkDiadp3DYXZ8x/V88H9jsQ
	5gHu9uANPg9kPz1ACPPXf3ymSdoR2jUqtRj35Zg03dslEm53Fvh4oDjLrIJXi/6pSzingr5gj6y
	zIhu64c7sPPZB71Lu4W3qDoPR8Dk5UWcrZcoz3GhAOk7nIIusPkSp67iYbQgvIbBAbYKqHo2xfh
	8eIzyqxFPfSBUJDljDR5Tut7WbVcDo8Wu
X-Received: by 2002:a05:6a21:6005:b0:3c3:b57b:645e with SMTP id adf61e73a8af0-3c67d9b3e93mr6647003637.5.1785127471629;
        Sun, 26 Jul 2026 21:44:31 -0700 (PDT)
X-Received: by 2002:a05:6a21:6005:b0:3c3:b57b:645e with SMTP id adf61e73a8af0-3c67d9b3e93mr6646985637.5.1785127471162;
        Sun, 26 Jul 2026 21:44:31 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e1255sm40989057eec.4.2026.07.26.21.44.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 21:44:30 -0700 (PDT)
Message-ID: <87947a02-2012-a641-25c7-deb7b582291c@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 10:14:26 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v10 01/14] dt-bindings: media: qcom,glymur-iris: Add
 glymur video codec
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org,
        conor+dt@kernel.org
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
 <20260726-glymur-v10-1-de451559e88b@oss.qualcomm.com>
 <20260726060031.861C81F000E9@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260726060031.861C81F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA0MiBTYWx0ZWRfX29GXPyOgKb3h
 GLjcEl+BNPNXUcwap4JIocWwdE/YuGP8RpvrzckLRT2KCHy09ZEPFQWGVKU5VUMcbkxAj6VTlqq
 t0BlhDkFMQ08ZynaTDfJWKNWlwqzIPdbf9XtujVqL764hmJSMg0PWJGwZCUGYD/uB4RIuaMbScR
 jyQzhcYAuwMEDjj/r7UyZ1nQyUjVszdl5yKC7L62XHKjIY8I5Jo6Z3bpxzX8WRfvKE2E0wYm/rA
 i54P4xXjaAfb5SWkeDErdNrXOd/0108JLDYzD/gwpYyxF06ce5A9n9xdIYuecLRlwSY+jxdmll4
 lwijWaRogG184+ndnNr0glH/4MJWJkYPaIWjKV2dglkkE9BXTBsBH+uETFg6ay2wFErtOaDioTQ
 V3oc3A3b9i2BfMSEzQ0cKm4GRCyOEhjiElKSGmek/KrTjADlxT3dz+nloDYbRaaYD/MFjTuhknV
 s47E9bgRQ5F5bg70qnQ==
X-Proofpoint-GUID: BxLOfW1fgThnD4PP7rRNBicKMterRT89
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a66e230 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1scMU-huRlgI1J5wvogA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA0MiBTYWx0ZWRfX79aiMnbfcbwX
 xxBVhRX8Ab9CGMRW58UHMIjKTnrurUqNcn6ovfxj/GPZh7w4IVznKfbcaRHc0LjKLi/BxU4k4pd
 3ygKhMa9w5HxyBV3msK+E2gg2k6AIYw=
X-Proofpoint-ORIG-GUID: BxLOfW1fgThnD4PP7rRNBicKMterRT89
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270042


On 7/26/2026 11:30 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The device tree binding incorrectly defines and requires `#address-cells` and `#size-cells`, forcing conformant device trees to trigger dtc warnings.
> --
>
> --- Patch [1]: [PATCH v10 01/14] dt-bindings: media: qcom,glymur-iris: Add glymur video codec ---
> commit 6a8af4611de5993b1c0f3d458ae92b3f17956b81
> Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>
> dt-bindings: media: qcom,glymur-iris: Add glymur video codec
>
> This commit adds the device tree binding for the Qualcomm Glymur Iris video
> codec, a dual-core video IP. It increases the maxItems constraints for clocks
> and power-domains in the common venus schema to accommodate the new
> architecture.
>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
>> new file mode 100644
>> index 0000000000000..1bb16206d859b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
> [ ... ]
>> +  interconnect-names:
>> +    items:
>> +      - const: cpu-cfg
>> +      - const: video-mem
>> +
>> +  '#address-cells':
>> +    const: 2
>> +
>> +  '#size-cells':
>> +    const: 2
>> +
> [Severity: Low]
> Does this binding unnecessarily define #address-cells and #size-cells?
>
> Since none of the permitted child nodes (non-pixel, pixel, video-firmware, or
> opp-table) have a reg property, and no ranges property is defined, wouldn't
> enforcing these properties unconditionally trigger the dtc warning
> avoid_unnecessary_addr_size?
>
>> +  non-pixel:
>> +    type: object
> [ ... ]
>> +required:
>> +  - clocks
>> +  - clock-names
>> +  - compatible
>> +  - dma-coherent
>> +  - interconnects
>> +  - interconnect-names
>> +  - "#address-cells"
>> +  - "#size-cells"
> [Severity: Low]
> Because these properties are marked as required, any conformant device tree
> is forced to include them, which will result in the dtc warnings mentioned
> above.
>
>> +  - non-pixel
>> +  - pixel
>> +  - power-domains
> [ ... ]
>> +        resets = <&gcc_video_axi0c_clk_ares>,
>> +                 <&gcc_video_axi0_clk_ares>,
>> +                 <&videocc_mvs0c_freerun_clk_ares>,
>> +                 <&videocc_mvs0_freerun_clk_ares>,
>> +                 <&gcc_video_axi1_clk_ares>,
>> +                 <&videocc_mvs1_freerun_clk_ares>;
>> +        reset-names = "core_bus",
>> +                      "vcodec0_bus",
>> +                      "core",
>> +                      "vcodec0_core",
>> +                      "vcodec1_bus",
>> +                      "vcodec1_core";
>> +
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
> [Severity: Low]
> Are these properties in the example block propagating this pattern? 
>
> By demonstrating them here, it enforces adding properties that aren't used by
> the child nodes.

iris_resv has iommu-addresses, which requires #address-cells and
#size-cells on the parent node.

>> +        non-pixel {
>> +            iommus = <&apps_smmu 0x1940 0x0000>,
>> +                     <&apps_smmu 0x1944 0x0000>,
>> +                     <&apps_smmu 0x19e0 0x0000>;
>> +            memory-region = <&iris_resv>;
>> +        };
