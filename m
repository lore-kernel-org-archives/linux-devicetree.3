Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499458;
	b=xtYxOxCfgyj/gaJDoGAeNGCwM96Zd+j9UfK4zdQS9DV5GkUDCpOSlhxHMCfKa9uIF5YG
	 SfiURYEnRjP/IPhwZ6UjDcyjTXAyL7IIdNMXL41raCFF89Rebb8XXn2RTfuzNxBcg5T8B
	 yfQgFhCJUpKfYKsu7MIkWifJGHljOh0R9TILqEtmj2yHZP3Y4cKa4quCZGhNcgKXf8SF+
	 d0c6Fxgg5ofKlvdAtg8dA42qhlohevBau6vVLdR0bZc1lcL6ZO01MsnFTwhAYKR7kpn4X
	 tT5Cb05cjjJk7bhAg9nDbKVLnUGRGubS2XZzTUBulMeZizY//Ye70SZEccbCnJD0uOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499458;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zcO4EZHYcvxPDEYxtrbQd73V1Ga4xxNs4GqACyVzAD4=;
	b=Wn9ylgyjAelZ5nOefrzfwTarqWT/zSgEhL0tvjUMp+O5Js5hKPdF31YR0hlXoKXquD9U
	 tFbzU9VlnjgJncpP7B2UyWHuE4Co5tCj7v1Hl9AMnsZSHz3ggOg8BHtFrVwVxaIz6U+vb
	 WL3HkSCgFfUWYklLC+dH/r19xawkOD+9pF6PXM07hLBDnnUXH6HGrFcQBO5iGK4NV96s3
	 nU91ytvhY93GhtRfRgFFUlYDvQ6ZRaGQEEK2KZnhuCy0ceTWPTflf2hKcJvYQfLXcYmR2
	 fCJ2BkX77cqSPjw+DCL6WmPHOGX2xEkxpqR+3YyJNPbKqpo/AbRcEHKImpDci2xB81g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZXmdSi5n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="FR2R//4q";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB482606A31E
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB482606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZXmdSi5n;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FR2R//4q
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxKDP1145606
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zcO4EZHYcvxPDEYxtrbQd73V1Ga4xxNs4GqACyVzAD4=; b=ZXmdSi5n/DG88tJx
	UPnGgvl3IgKNtWd/ecIZr8qlbTT5aAVPWz4yHGN6r7Bivaw0lYGZ/eBZ9BuAwt3z
	blHDmwcKpnq3o3u1J+CqFWYsEgB431fRyZJA9ynjTZXIb2bMwhycJZc3Vba1270x
	mDnJHZOBUepZPchh24itBwpmuAbzeR9ObwL6VsLM0zi3bivKAd9Yx0tnkDGcVkMn
	l3Wg+n+HjGpeaJgs6HK+lptO4Xq5ZORGxulLbKbHhaXxaY1fdNK6crCNAX1Dz7QN
	/LSFDOrBf6Ce3npWqnfZ9J0KMf3peOniv07fCShYyJI8nY58HGCL0kBv5Ju2QzsS
	zyQMgw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5qae1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:30:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93df7a9466bso46612785a.2
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 05:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792499456; x=1793104256; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zcO4EZHYcvxPDEYxtrbQd73V1Ga4xxNs4GqACyVzAD4=;
        b=FR2R//4q9gB2RcUe9SyaJOUNRcMYCPU1VuP3HxcZylZ7hZy95Z82FsTQf123Je5FKf
         a9c4VMB6yu50WPRuSUnZFrwZC0d6s/wBwtJtDyokG6M4z557ANSaYqwDa0qnN+0Bq9oy
         42kMJU9vEh4oO9wtU1UuRI2JeVJCRDGsrMfTOJTlc3vK+vBhe9KDaQmolteCtRRut9We
         972zARMAr2OgMBS0fkHos8tCyMdWWx8Wm+V8OG3feaGSQPaIuvmku7BT9Bv3ibkyfGub
         NigSC0VwyRPjG2/bq+s16VqK0xYdllKxrEXFNup6o+Iw5AEezFX+9X423CfrNPUwpU4n
         VVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499456; x=1793104256;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zcO4EZHYcvxPDEYxtrbQd73V1Ga4xxNs4GqACyVzAD4=;
        b=DbxvOLoa5zmUqfD4pBUMXONM6J5Z/5Gi2GUP8GXNWqDqzPsWn0vGACrPf+SS+uO+xe
         aGBB/aS/qsbi779B6ceVmtMBEH29uM0XPj42ZIAlmyhr6BT949W07+5CuaSPnH517NiX
         6+cRBJBVY/UOT+VGfFd2j2SM/31e9bVouoVmaIXTocHOVDXxzp9RiUCW/lkAtc7xfAhz
         D2VhBnn/Yud33135ELOr1lQZF0qgv4pFJZDKIKP+3Pkgat5hG6IufgcH9k5HI2EDcspL
         gTKgIp0Lw2w7PozW+z8OwAUHchzINkR6NEaUim1XKjw3Ba7bwyOJ4O+dDzPL3mU46L6i
         0+/Q==
X-Forwarded-Encrypted: i=1; AKwUvBya2+KyN9d+bh0zHRLE0gwVtDEDlwESJVRq6dzjMJBqGeqc77m0n4bP5/sYN7DcREPw51HkPofFnGfG@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7DVNvJCZBXifY4BLckk5aQhyGTcKsOI+IxlPoow0c2lQlSniE
	T1tB3DLTJOdISYGgaI5nrMUvEK1hv9NfnSWWGB4DoDOnkPb7Vxn81jkwiOljlHUYWF6zwN4W1to
	eYGbY0Y3mDG4Ft6CA7g/8yzW/AGLAd+XaNPb16xbK+keGYtV0hfnzSlkeQU+x4SSC
X-Gm-Gg: AYBFou0O/78orvTQnKdzgOZ2s0/EH+MZCorHklWZaW5BnTBYaoR3u8FOqcPuYwFN+Hx
	qoHvlU3fJ7ztpzD5fyxJe7ErykNXcv13morYAFXmhwDZI3Tbkg1G3MbO8jInBzRWrKd4ZWj7Lxk
	2gRY8SflO1TZr98z73EfK/kX2IwZXC7+QceWbhgotyFa7IhFZhkiSI9ncyoK0lZTBNa9e3+TUpq
	5gfURuMybQWNnK5G0tdEUTN/6J93/BLU9fYvLp5eFFDT9IVgjo4dawLp2qUyuTaGnaaLMan6din
	HCqrQ9sos6v52vSixs4ltVOsQAvffQYnpltmYELTKOOksOJbWxqgrhWgiLJ5u1jqVolTQLIZc0x
	N107LHSNZBnBLSN/CFo1S2w==
X-Received: by 2002:a05:620a:a99a:20b0:93f:43a4:a48f with SMTP id af79cd13be357-93f43a4a566mr535237985a.5.1792499456012;
        Tue, 20 Oct 2026 05:30:56 -0700 (PDT)
X-Received: by 2002:a05:620a:a99a:20b0:93f:43a4:a48f with SMTP id af79cd13be357-93f43a4a566mr535231885a.5.1792499455448;
        Tue, 20 Oct 2026 05:30:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1c6240sm5318361a12.15.2026.10.20.05.30.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 05:30:54 -0700 (PDT)
Message-ID: <73e35f02-002c-40f0-a42f-92402fc058ba@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 14:30:50 +0200
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
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-dell-xps13-9345: Add thermal
 zones
To: Liviu Nicoara <lnicoara@thinkoid.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Aleksandrs Vinarskis <alex@vinarskis.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261006185557.23016-1-lnicoara@thinkoid.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261006185557.23016-1-lnicoara@thinkoid.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: M4kxTb5zIqxV1kpeKKpqI7TRvsjgbbEq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0OSBTYWx0ZWRfXy0/PTUcdZUoD
 1lZKU9zl+HrW5z6YGIYqmVlwUwVzgH9lwlN6uLG/QKY18IbSzoCpPoSMVXt5Zp+PMXcxlpM9+uP
 YGBI6hZML4SnhtPMwltO5pbFhLn4F4J6NRT48fdZygOkb0XKQgKyM1WXslo9dmD2hLrbIMGMkb9
 gDa3kW4U+oFdccEVjVthPYONvyy/P7S9/y9vUGd0htEu7bCOYQBzEp7PwWvxewOQYBbbkpjp7iR
 MlKgxJ1vzcaGMHf6M8oHJ8/Yhi6nqLLDw5y7qEZ46Ok3bjeS/0JbCvOCDte9jiWtSbCcWSUV/qg
 +/KagRGEoZ6W1U9OMbplTTOHPEP57inU2STe2SyY0aHP1x52IxUYaHm1Izjaffgg6XC5zYcXP2N
 lmJteI4fY5mQO0/75x1ls70OmVWKA3aZ/fPPStytEXA3n7qzBHhbo/isEsphvxbehOx5hbOVxm0
 AXjlxbqeR/Tfa6Md7gw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0OSBTYWx0ZWRfX5jQqYOwWkiod
 smY/EE9Q6DkXtQvmvPgNd3RCin+JOnbpJAqx26RzUdJQnuc6NuhsFcUW+EBljBbQjwFWE+kb9d4
 VRxviSTOPUqRPIjXfLUGA06x/aS0Uvg=
X-Authority-Analysis: v=2.4 cv=LpcHWXdc c=1 sm=1 tr=0 ts=6ad75f00 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=vsDZt6SWGVavrg_UzXUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: M4kxTb5zIqxV1kpeKKpqI7TRvsjgbbEq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200049

On 10/6/26 8:55 PM, Liviu Nicoara wrote:
> The XPS 13 9345 has seven board thermistors on the PMK8550 VADC: AMUX1
> to AMUX5 THM and AMUX1 and AMUX2 GPIO, each with a 100k pull-up. The
> ADC configuration in Dell's Windows driver package lists the same seven
> channels, SYS_THERM1 to SYS_THERM7.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
