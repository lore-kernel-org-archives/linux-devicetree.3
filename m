Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A44E42B30E
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212264; cv=none; b=OvSgRIRIcOKqmfIHfSViufpBS+m4PQkVdByKdCBAfQ9QYze9ZPKlk7NdP6n5Ovrdu/BokOgMdqKxnyGwMo8co14Ri0swHCt224oU+ZQpuoGzaMaYvU+gYkvQr+GQkQG0N9qb0g29IuXtzXQr2SjYtovdNOfnhfIM1eICmEbFMSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212264; c=relaxed/simple;
	bh=MdhhEcrXg3G74Z44irDwxpefSRGB6k/TIOfVj6GF/eY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rI080j9EJxMPN5/QxvpK2njy0OF1YIxDZgah6EYs/+Z4jdzXl5xTdLOpEZIx1Tnx6nN4th5Qki6SasflQU1ziOS61g6ewVWLecwq/+qismqKOt8S6HxOieiuxgIpxX5JACrM6hQAXLVG77uLUKhXDlexrMJH3MYY5iMgX7k1eWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UQNP8j4N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YOXd9cQL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UQNP8j4N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YOXd9cQL"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJvIS2838020
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:31:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zrvZ191+qOT2hmPG2HGPE9HTiYGqZcw9cgqbolx6n2s=; b=UQNP8j4NqPcCh9pv
	lGheiLg4OuV/RJ/j5K/KeoOOhvQIpGRT4LC6OClis1rLs+MW4sUhArqB/rNlAPG+
	FDM7RtPj0gBfb4I3VHy0pygPf4ZXzdAOadm6ZNy/50tm3CuYXqOyG9+9qO+Xa1Zg
	O5uW86+vQU4ywa2eD3Zk/a0sH88M1NtY91dvq5UsLJcl+0ICBy2zkp8oh109jVCk
	JthKockqmPNr0Gj7PX+lpcy6qAYLoTwoQgFt8VRMEb6p3TidPNZRf7KhyAr0tace
	vHjCarkh6h7b21VXylapkczZp5ffYJNE8IMhZxDV87GExewTrAU5fMEP1eX3lKcW
	I7Qy8Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feefqmctk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:31:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cf1c86963bso2863105ad.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 07:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784212260; x=1784817060; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zrvZ191+qOT2hmPG2HGPE9HTiYGqZcw9cgqbolx6n2s=;
        b=YOXd9cQLCskoWxc0ZEmL8IqCX3QMu4AAJqmPQJNbmzHW2RHgw0a7VrUAov1Eg1fjXK
         46D1l136gGOn2oHyG+e5t7i299bk64+0QGNyYcNylh5ZbWJoVLx746HZ4fGbiO/QoB3/
         gbVn84imlLTCV4i1XGg6WgJr0fEltW/fSoHGTDmezEKJWrYWkiBTgJ/mXIfK6ZrJsPlv
         vVdKAqdbEFS2BeWHLCtMWsVsOyPEXg1CqEi22idpJUmhnnaV6VT9nqf7gxhHE52yAQ4s
         EMSQdVGj5tP0XbwBxIaJQDk+QdaNWLjYMgbCKtuTFTFxvUXlA20cun3SVWLudXvg5xZQ
         LEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784212260; x=1784817060;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zrvZ191+qOT2hmPG2HGPE9HTiYGqZcw9cgqbolx6n2s=;
        b=WyYz6RZKeJO1I7vsbnCJEVabGvaek1wZmvmUbgVboX+XxQgyLnLW45CNaS7Mysiqyk
         me62KfVHmXZdF6OUwKj9+HbmumZR0GW+jdWV6gRdxrZKk5WTson/b/sC0U3ffd4C5kg0
         Bgy+taLim+sBnyCA/Q4yEMCe9iDFJ66tuCD4aGIaW6Y7AbglLNUdfjTooERAMHY9msh4
         zU2x3x0+hDdK3hWm5AEJPHsNzBgK9mTfT2t/bz8K0kvfBpohwGcqUDie9dI3EG0iro3x
         FSEhOdeZ/wkodMUem87cYKEV4r6N7jZWIi4M4+h1jjMf3wUkyl3whPrnBCXGU6dRzzYl
         RQRQ==
X-Gm-Message-State: AOJu0Yzia+dtDZm6ovhjJZFl+Hxhv2St2jKnjZatuzS5HSIqqZ3q1RxB
	bFj+yj2jR6DFlHTWuQfnE8H8n6sVsxe8yaOnpNJMl3sN2YErTd4XRjtkqtq0v2xghC3NlXyRwkS
	UIjfMVUb4hRLacDM+hVYnoiDuimhgCZ1WIj2w9zU5xbf93fItJG6paLvk5fDzuCb5
X-Gm-Gg: AfdE7cm+e2Y+PTF1K3NE4IdCswbtwVWpdMCWDr59lKZJaDeIAJTruC96qXeF2jIi+Th
	VZftnznYmOAebo3u9g2P5BKZsd2mzBY52tZ+1VgRiVMFNKbeyUe8PYt407vI/ERZPd77/JApVAU
	zC9QPXUPQqOtN+9lCaA/ANDzele686IkqDYqoMJF29aVKxv2bi0KHA3cOV9OKPqDH7A/uD55dhO
	jxTsmQBzAlCVtomLZk9T10xKquqnYGlZXwNUh9AxnVBo6H9aAes1soc8OJdnofFRpHiOmJUNtea
	d9YDKRhOXHhgHQLhprsV1Rc/tJnP/XVKrEmXljFoRFjNSo9GkWkW2/LpaAXOO3q4q33z0KgxWr4
	q3UBsapOAjIzbpVtG0or5CjcVwyWbQaX9
X-Received: by 2002:a17:903:1a0c:b0:2c9:ece2:822b with SMTP id d9443c01a7336-2cf1f280732mr27106305ad.3.1784212260460;
        Thu, 16 Jul 2026 07:31:00 -0700 (PDT)
X-Received: by 2002:a17:903:1a0c:b0:2c9:ece2:822b with SMTP id d9443c01a7336-2cf1f280732mr27105825ad.3.1784212259862;
        Thu, 16 Jul 2026 07:30:59 -0700 (PDT)
Received: from [10.218.25.112] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf100e395csm21109125ad.17.2026.07.16.07.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 07:30:59 -0700 (PDT)
Message-ID: <2126bf8d-6e57-4954-8ad0-6916909b78a9@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 20:00:56 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/3] arm64: dts: qcom: monaco-evk: Enable SDHCI for SD
 Card via overlay
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260701081715.2580329-1-monish.chunara@oss.qualcomm.com>
 <20260701081715.2580329-3-monish.chunara@oss.qualcomm.com>
 <20260701083148.0F8341F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
In-Reply-To: <20260701083148.0F8341F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=APNfGQ4N c=1 sm=1 tr=0 ts=6a58eb25 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JAdZSI-3jRdRqOvazjMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE0OSBTYWx0ZWRfX8DxDdLFQoA/S
 uscVH2rcyyBd7CwuMiSu6g8xqghrD5nE0iFgYrGbzR9W9J+rQ5dm7zRmaweY8XZAaC3vdGuvVPk
 jb4pUN6CLnkCV0slcORO51l9wUslJQ0=
X-Proofpoint-ORIG-GUID: dmKkdBDKFI2oyARXtSaJSogN7LeKoc9g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE0OSBTYWx0ZWRfX5zzHe22Qm8xK
 M6pkN9Kx8dMT9F5sgf2kBTlFfm7ckbwnAclqZ00BQzK3BjATHLCy8w4UWnHEAVm0E66uVwTgx18
 UJ29BLtiDoIb/OuWBlzvpyPfzq4B0HEY42Wnh3iTv7E2wBDgS6ET2PW4LSKfqdXf6hA8wUJdly8
 MhvLQTXRTiZbT74v3yc7t8Wcmlp/FYSWjgzwQt7KKV578LyaPFnNIW2aqI6mLip54a7idxcH+p9
 Rk3dhrwDALk33PjQb5Mzr53PPmF0t1btkGuaHihd1yDTLekn5eoxw1Bq4VUI8c6XMtNIyoII3a+
 bbkX/gzaYOFawMwAbxr08LnRhvMdMeKIi5N7xpKgvNIzfXbIin+aC+QHTMMCotcEcP7d9pGTbK8
 UyyXiN4ZcFp3HvJBhXr9dPugEmim4RdXZp4EklFmDRE91L3wjp8ACRpIr49m5TISOvkYc6LjUvP
 QLDMzNRemDNbRY2rs6g==
X-Proofpoint-GUID: dmKkdBDKFI2oyARXtSaJSogN7LeKoc9g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160149



On 7/1/2026 2:01 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The SD card overlay fails to remove conflicting eMMC properties (`no-sd` and `non-removable`) inherited from the base device tree, rendering the SD controller non-functional.
> - [Medium] The overlay configures 1.8V regulator states and high-speed OPPs for UHS-I, but explicitly disables 1.8V support via `no-1-8-v`, rendering the high-speed configurations unreachable.
> --
> 
> Note: The format of this review is altered to provide a free-form summary
> of the findings rather than inline quotes due to recitation restrictions.
> 
> commit 8700d2dd7b89a43576ae3f5ad283ea9e832db05a
> Author: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> arm64: dts: qcom: monaco-evk: Enable SDHCI for SD Card via overlay
> 
> The monaco EVK board supports either eMMC or SD-card, but only one
> can be active at a time. This enables the SDHCI for SD Card support
> via a device tree overlay.
> 
> [Severity: High]
> In arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso, the overlay modifies
> the &sdhc_1 node by adding no-mmc and cd-gpios, but it doesn't explicitly
> delete the conflicting properties inherited from the base device tree.
> 
> Since device tree overlays merge nodes and do not implicitly overwrite
> boolean properties, does this resulting merged node contain both no-sd
> (from the base) and no-mmc (from the overlay)?
> 
> If both properties are present, will the MMC subsystem set both
> MMC_CAP2_NO_SD and MMC_CAP2_NO_MMC flags and refuse to initialize any
> card? Additionally, won't leaving the non-removable property from the
> base tree intact cause mmc_of_parse() to bypass requesting the newly
> added cd-gpios?
> 
> Should this overlay explicitly use /delete-property/ no-sd; and 
> /delete-property/ non-removable; to clear the base configuration?
> 
> [Severity: Medium]
> Also in arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso, the &sdhc_1
> node is configured with the no-1-8-v property. However, the overlay
> configures vreg_sdc with a 1.8V state (states = <1800000 1>) and sets up
> sdhc1_opp_table with opp-100000000 and opp-202000000, which correspond
> to SDR50 and SDR104 modes requiring 1.8V.
> 
> Does setting no-1-8-v force the MMC core to disable UHS capabilities and
> artificially restrict the SD card to 50MHz?
> 
> If the board genuinely supports 1.8V, should the no-1-8-v property be
> removed? Alternatively, if the board cannot support 1.8V, should the
> unused 1.8V regulator configurations and high-speed OPP additions be
> dropped to avoid contradictory configurations?
> 

ACK and addressed in v4: https://lore.kernel.org/all/20260716142445.2767955-1-monish.chunara@oss.qualcomm.com/

Thanks,
Monish
