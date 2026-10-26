Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793028513;
	b=K5GYVnOR83GFwKKWM6mk4oLLWmqbpr8z25W2jVzF5vdeMEgyE1hgmcsCsr9l5fHk/zrh
	 UufN7BrksrICZGO0ikK4HEjqh8CQaZkYXR0jbnQtsKhl2pWO/OIkyBUQlGetZH/bGhTgL
	 +zIf+eJE9mn2Jhs1hHRZSQh+9YHtBTloCNfcDSEyaw8Ezgrdqm95rQAFaFvJ7ewlNbexE
	 o9iYNGeSgb/xO1sLpc/EjxzvGio7gYo49+5zlIJIMbyH3rjkMl/IdnzGWzZ17ctTik273
	 luY5vG1dg5yuqAo0xwWfMLyIiSpsSuG62ixMBZdpyrYkPqTNIYx5M6noeDQ15+rBxqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028513;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hXcHUx7gta3QYy8zKukEnpiFjOMOzlxILH6yhsvVS3k=;
	b=5cqAkwKp4GpMSCRCMzYYkBjIy+Xf06YXOuOYn2h45AtfY7uTn6K76klb2C3QcqCGOKZl
	 B8qU43gA5JdLvKLb66op0VpyzhtGe3gPTkTdZfmGDTLUTVKIZF5RIzMpbZ4nofjD04SUT
	 NTVQAdFShQHVWrxUGci+duUX1GlCKpEIUF5IBnKrjzGID2yuF/8ElMC4DDW3xR3dyZ4C5
	 Y+5z+odh/PY01TDDFQ+xqNP90u8KZGKY3CtLkEKUTGubO0qkmYJiSX4NmqGLvrmA0d058
	 TWKp/dtlEQtAO2fsTfBoAo2ryc0zxrxdoB5smziaSbazVaGW5J2qg+UKwDoYpXwCfcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MnoYhO3H;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fk21S328;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E40606A31A
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 15:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52E40606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MnoYhO3H;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fk21S328
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvsBT3268516
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 15:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hXcHUx7gta3QYy8zKukEnpiFjOMOzlxILH6yhsvVS3k=; b=MnoYhO3Hq9ye7d3n
	I70bVPkJMUXaLd4BchJS6wdZIeo5uumbSB7Ayb2MbMTuWjBKETyLP0iTxmEuvQs3
	FUe9MEZHyQT6ySivib1zo5jcl/hpYCLLs5JpY2KLPXp3zsE7Zo2M1Tw/z/6ygo+b
	RjuRgGr9HhstP9vEPnuVuXn4xG6FEZAsc6ALW/Bh2hQkDSRQDc0JfN/Fxbm/Tf7e
	LXVAw9sjVBDhAjcy+gDYi84cpec+dvIe3fljak7hGhoyghbdMIEj1DAtaQxDbbVL
	+tN5EnQNrdk86SG8RCYEU+14qxO2mUo/w6XmoBAGYPDbhjGRz9B2Oq0oFwydo2hg
	d7+Bfw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp9bkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 15:28:32 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eabddbb650so65160e0c.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 08:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793028511; x=1793633311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hXcHUx7gta3QYy8zKukEnpiFjOMOzlxILH6yhsvVS3k=;
        b=fk21S328HViUZqIffDGbZjQ54kRTT/OM/R4uX9wXY6oTeE9si3orwptS2C7Qhq90gG
         SU1y/IREdSnmJnmccxb9WZzrOOz6iTmgIbXSF+NnFbTEcX/vwpgQLSnyBzHeEQjw85PV
         LDrwUPvoN37dNbo8BctMcFb5NTlrbzbxG9eIF6rfNHKVr+9YFwJr0Uh0Acuj32vBgZ6/
         sA2ODRFc/a7+EbLiGxNTYAoatKcqoLKSP3KkrTo8luqDaQM0gpq/G3LY5xu/dYnGLKcd
         6hdyzb0GC5q9dFjKm3J2ozBnpr80E4R0lcxjU+HBRPjuvJo2YkyPYPe7RGLel9HZDfZ8
         Sbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028511; x=1793633311;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hXcHUx7gta3QYy8zKukEnpiFjOMOzlxILH6yhsvVS3k=;
        b=pwmFHGwq2+eJrkLKm8dDMvq8uQg5Mc6A8CHZazdwStE6A/se8mf8U39OEHURj3CAF1
         WSRA5/MZS+yLmSHCY8Zv1ICuUzHNp7KTeWQk0uNR7ZbnYkTm9X2PfIlJZzc0CMFcS2Zc
         oSRvB6VzhaYvmJi2pqzKorS06wcYOGYJk0NRn5uxSL+OovIxFljuP/yxj9q976HOFAQp
         cMDrlfS4RQWhODISe4Mw62hX4JhewPP8fc21DqB3fafctYei0ITbw2rX79sSuRJq1Rur
         xcwUv+B3+qiqbWC9u9dd/fa4fx1iiQPiDiKfYuiHyHaqneNmr6HQLadyvjTiR7q13+iL
         7C5w==
X-Forwarded-Encrypted: i=1; AKwUvBxAOsQxP/Ic5SqCTgdUUTnvjZqL8Krom4/MYFwMBRQnRyodVJ8rGNuPY18DB+7EZ/9DRtKlDB/7R+Xm@vger.kernel.org
X-Gm-Message-State: AFq9FYLi8gShHez93MmerpT5sVNGzwgznHRexwCnX/ZpSIC7E91R1u7t
	iRAIUMxQlepTF8b1k8OnpfYq92O05dfsuINxnUu9BsbM+UgKBeIpW3LajlrIW/AO5d+9qIriXLK
	bpsdNUCLuarNoDaG5/Dy7kDlVLt+TiqgzGewNsw1P2k/O2KauiUm+NNkDxf7nW4FqQIhYzEyO
X-Gm-Gg: AYBFou0NRqVEDJKB+ona+SQHurJfoKqknAlrsQE4P9Y3MhxZNNrJq33skpfn5AdBrD5
	vI8unfcAfk1//AUzpG3r5cCX+NS34TB4luSdGlHjSt/EdlR3qx5qMRWGrn3/oyyQWqo6f2f0cYP
	Ptc5aV5WD11eghm5XAwBGlLRClbSAaCZ5fvAD1XQOleYJEpYptWMCoNJ2wwPhqDihJUXOTsPB5I
	fnKyxJ/oIr77g3Wr13E0O8l0ya+ZImHRuFvbCASDOfFFodQDZgH/Omy6FFv+xY+R+PTcQ1UAmK8
	v9HSHDLIApRtZHSlY7QvSEW01bQWyPb92zA58Q14fOL6VEc5+PR8fbE/Rdyhi8Rgh9WJc01/C5E
	Q7XKd+bziGvi9Bz6VhC0lKg==
X-Received: by 2002:a05:6123:593:20b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5ec2332bf58mr2107147e0c.5.1793028511367;
        Mon, 26 Oct 2026 08:28:31 -0700 (PDT)
X-Received: by 2002:a05:6123:593:20b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5ec2332bf58mr2107120e0c.5.1793028510938;
        Mon, 26 Oct 2026 08:28:30 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e9968sm334450866b.17.2026.10.26.08.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 08:28:29 -0700 (PDT)
Message-ID: <652f45a3-8af3-4460-a081-30f67bee400a@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:28:27 +0100
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
Subject: Re: [PATCH v2] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: enlarge
 reserved_mem1
To: Roman Linev <admin@mswin.me>, andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        barnabas.czeman@mainlining.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260821032541.1856299-1-admin@mswin.me>
 <20260824155535.335494-1-admin@mswin.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260824155535.335494-1-admin@mswin.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2MSBTYWx0ZWRfX2TYURTVhl9oQ
 Bphivg8r+eUHVg012Mi4s9+sacVvhoTgXW545m/pcmT72yHF6Zaz9k4BuQhu/yt0zGrAXgLo4WH
 kA8sFDE9zn9S69FOUOnUXd6bSJwezAVThKcC4GAzk+m4Lt34n7+QcDhnA8FnSD0VZmNN/we4g/i
 A57PANZ3iSleJiP0bx1r5RoC6kU6+TrbrVuPaq0Hx8QjiFnLucv1xbcXW62CChywBoDITjC6rnd
 Glkqx7dhnTEMkFSdR/O8ss0hr1c+gRo9FgnPjba+w3QFOMup4sZ8/uslYN8qitYCxbsExjJrWEM
 Gx5iQtRW3P8W6oqvH8px87Hk3d3OH5v/atFcE8vVVRpBm7urOICSo4Js0hDcpUh9dmgnd3tnlM3
 pa/dKd2ZXn2rf0h4Xeeydv0LYiJjnhxu1QEubjJDzp4RELfrOtHMSUkCeEd0XkK2WbpnyLM6EcB
 lGQvn/IoJDQwxTt2+DQ==
X-Proofpoint-GUID: fRoByXk-IIykchqy8_g5TFKHqICMab1-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2MSBTYWx0ZWRfX1/ATOpr55yyd
 UEQd7esALHKVVHKYi3Tlcw+XJgN1hQzWnDen80acZTi7x4UC66wMDQ9ZT0q6bm+Akok/vYOFdVM
 9nGdUbNa5U/mn0mxqeDQ4Xr2UmOUvrU=
X-Proofpoint-ORIG-GUID: fRoByXk-IIykchqy8_g5TFKHqICMab1-
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf71a0 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=p94XzNcQMd10UbPFJ04A:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260061

On 8/24/26 5:55 PM, Roman Linev wrote:
> sm6125.dtsi sizes reserved_mem1@46200000 at 0x2d00000 (45 MiB), so it
> ends at 0x48f00000. On laurel-sprout the firmware owns more than that:
> the downstream device tree describes the same base as

[...]

> +/*
> + * The firmware carveout at this base is larger on this device than the
> + * SoC dtsi assumes: downstream laurel_sprout describes it as
> + * removed_region@46200000 with a size of 0x4900000, ending exactly where
> + * camera_mem begins. The 28 MiB past the dtsi's 0x2d00000 is not the
> + * kernel's to allocate, and handing it to the buddy allocator wedges the
> + * machine under memory pressure.
> + */
> +&reserved_mem1 {
> +	reg = <0x0 0x46200000 0x0 0x4900000>;
> +};

Please update the common DTSI, it matches the reference fw map
and I'm very surprised the sony phone didn't crash without
that reservation

Konrad
