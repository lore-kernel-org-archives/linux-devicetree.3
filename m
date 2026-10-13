Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADA33CAE8D
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 09:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882434; cv=none; b=Pmq3OhH1x5tdl98DGfSEuRJNK/WcCsga9gG/0mM86MBOd/8YtP6idBLBv2dyQFMPXxGZJ71zKtWQX4+3+V/E/M/pkMC++5uTbqDDKLPVAFk8K77PBoJrlpR5C9R+ivFKjo+rcKdmQf+8nY/9QlvIOid9b5EeLbxmzB2SyY3vLM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882434; c=relaxed/simple;
	bh=D5v5XjS9Za/NZrCDDLTC3rmHvrDIZNE1cAPRc78Y1jY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gENCRdKTINlujcoQuva/oMli6Esf1Xp5zSV0hSA22COornVaZPNC0x6E0gKlBMxxNF+FWbTA42uEHTJL+XGw4moco1wmZtOXfSRR63Up9y2akFUm31MbdxwcrZ3y181EKaE9GFhE7LHRy3UHqeDW20/S9BXYCdiDJNvOytKwr0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NfUnAvJj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZGh2BfF/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NfUnAvJj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZGh2BfF/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D943ki483019
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 09:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oczbn9c8EH/S76/n/7Imk8gAToyAYy+KiSqeDjWGDyY=; b=NfUnAvJjerCyPC70
	bs7AX8X2H1HG4lFOxsy2Ocyeb0Z3YG8bKo5vhgORpsq7EXcDDlXIpp0DUYgS1Uzt
	aUKITslRV4Ko1IFJ42SNAfRnvzFtX1VDOIJ6hHxpHrUEGRWcZdMXRvL1Sp3tRUrr
	4+p/mCIm2AdnxeLH+wtAfRA/KMHt+io37kZuW3fQZ6pYasqR6bcD3bVC6Kat7Aip
	QlIEffB9BCPzKJOC5UPLXpN23Kh5AsjUt1QNMWY3JEUyTDtGaHUQ5dH98R5UCq6P
	h5JQLbX1hIsAAV54p9EBUShzk9YtI1xmvERmoVlKsfSvtAIJPCtV68pZOUaMw0Lz
	jGgndQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hpg80et-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 09:07:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5356c6d98cbso8367791cf.0
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 02:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791882432; x=1792487232; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oczbn9c8EH/S76/n/7Imk8gAToyAYy+KiSqeDjWGDyY=;
        b=ZGh2BfF/b9R8bfsYf/E03+GGk8qvtjGg24GknAkgxFzIfMVdjQm2ksTlxnoyyO4Zz2
         p9uJp6rCQ34UovS/au5qIGbdpjXr2DxqRRaDDrEwOybEgUdmtrU6khwdrFqxjouPqtps
         usCZQ11kvPIsx+BCabDDpl/cz51M8b8W7itZYzK+EI4fgLLxbGhLLJrROKw91PXmmgIU
         i9WpU4asMxodRbOfWTN4MPT8XRhMPsAUaQjNIoqKVPFTpyID/4m3yySDLdxsZjovz2Iz
         8oUqSVkmTHzAv/El2JYCshFHH48bf1n5fvNZtn5ZnIdWOUe1pp7DcIBUUhv30dguM3/T
         HqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791882432; x=1792487232;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oczbn9c8EH/S76/n/7Imk8gAToyAYy+KiSqeDjWGDyY=;
        b=La5Whg0ULhoLEDhABHCxaajwFoTVex2NRSUvUUroD9Tur7D9SFUzWpnD/oYdMvd/8E
         TPZE+iSw26JAu9RCtB8e3PpxO/W+P0zDK+XTgJ7AvZ6GZr8HJsiD4HR3vx8NAezsJ690
         JV3G4fIEciW8ELZcXIhb2wCYBpAGr7KzK+QOsaVq3v70aW+VwDTvrSsiyle991Nzybp5
         KMHlldA6yf3We53cDQ/S1XZ6QNpOM5ath/c7H7YK9xNPpF/7htOAgCunHyC1vRlSV8w4
         mQ8Y7dv0E75w6QMpFf37V3icdT5dz3yJYi0GSRguMB+dmF41w2d4LlFGscmk4lxQGGzv
         3Fcg==
X-Forwarded-Encrypted: i=1; AKwUvBxDcXlSz4c+tJF9ugvZS3xvAj2oRLHkwKh074nklJnVVyZV/4sys4cGpEVUBq+EHV0NqHB6gRtCdOb5@vger.kernel.org
X-Gm-Message-State: AFq9FYJSspG67lEW+ghDZe/ko5oS1EeN9RAMfDHOWaJQPVFRlShk73S7
	+GGroQ1XmyoWmJ9TdciJ0yCUYSWWviC3c5unck1ZVoDoDaX73nXvH8lrKBDOEUQ542M+tgskOsI
	QHyvtN/4ubAbhZTlajLHc1tQZWCQaoEeLzHGwf/coUU/22HGTJw1YsrfCWwTl6kQO
X-Gm-Gg: AYBFou1EeRPnsvewcFqs7rIDCMAj2zSnT7gF/UV7b7hYNDlyElI/l/h1e4zYKx1BACE
	YqxbG8kBB/C/2bFfh6xm5X2LLFJlxDdDpcWdFaJ1RTNBjy0PAd/U6QYDhKK7C7YEeVfDRTndfcP
	RNufaRG43CvrDSo5ijH9kmorOIar1ZHJH6MUSiuOjOeP1x32INhSka8f/XZNEwKIYnhKDPgq4PJ
	o1jHSBqtUBWGo3pZiTRNw/MIXbOygs50JzsB64Hff+KLiGYMn+ID2k0dqfo9bHBH9xNHoJWBzMQ
	4084dzoONa7RfP/ExP0CHVTO0FsWVh8L/3WjDj7oIEEFH4CIHoOOoWJTDOUQ4PUPGAJKIF5Bd5V
	JX74EpSgNDxs6MGoDilf1Uw==
X-Received: by 2002:a05:620a:6501:b0:93a:1312:ff19 with SMTP id af79cd13be357-93ebd2661bdmr2413309285a.5.1791882431702;
        Tue, 13 Oct 2026 02:07:11 -0700 (PDT)
X-Received: by 2002:a05:620a:6501:b0:93a:1312:ff19 with SMTP id af79cd13be357-93ebd2661bdmr2413303985a.5.1791882431112;
        Tue, 13 Oct 2026 02:07:11 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ae6fb7sm551980166b.84.2026.10.13.02.07.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 02:07:09 -0700 (PDT)
Message-ID: <ac6f5318-6257-4e42-a6e0-9f6a94c8eb5e@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:07:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: nord: Wire UFS PHY symbol clocks to
 NEGCC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261008085640.3512895-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261008085640.3512895-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yQ341JckzhevgGkjm3oQ1k6L6mh6jfAY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNSBTYWx0ZWRfX0sietOmVvVvi
 f5C/Z+HEqoSdYPqLypgpYNqN9ucC3b/qmQ3dBxINuZlL5JTCbIXzT20lT27VX8A8dpAanpSWO49
 NcnuDOPEe9iL3as8NWY7oVsO75VCHcY=
X-Proofpoint-ORIG-GUID: yQ341JckzhevgGkjm3oQ1k6L6mh6jfAY
X-Authority-Analysis: v=2.4 cv=Z4Z5j3RA c=1 sm=1 tr=0 ts=6acdf4c0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=wmFSuXOd6YqTMbDCKN0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNSBTYWx0ZWRfX6wTM8jG4H7uo
 hkC864QtynHCtnVBJsiV3BrNDq57Qe/HRYcMunX4jcaa8ngKpS1QE/u6qy+o0ZSaNbqeo7GcGcE
 HOSgmlUOOJKCzT2zSnUiKcxoro/fgR3wcHviCj1ZrDqaPTxyHdtEtx+tV0o72sBh0tAh9/IGS/4
 P1DZYKSZ7jlSzRV8ZnS0vfZiFt2WxhlHPflosf6sHzkl+Pd+Ln+iRbN/70QD32bptSa4jW1arGh
 Ow1T+Pxx0VhvO72i/6w1iIhHQfBUh/FSczerZ9sYIsnB3fbHrzYoXXKHu2BwiAZnAfTbFeoJz/n
 rT6HD+XqAXYLUcPmGlEYuypY+TP1bUhjCGKq6AGQIQh44PGcEVJHdXXVjdJqBZJFAmuMXXLrDJR
 yb+WWt3bs9j8nybKDK0dbZScZexLfB776WBlvMze97kf8ZMH/xbPlvSpOGnMragJLfFNdj5CMe+
 AO32GQSM4qPZHXv1AKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130035

On 10/8/26 10:56 AM, Shawn Guo wrote:
> Pass UFS PHY symbol clocks to NEGCC rather than leaving the NEGCC UFS
> symbol muxes orphaned.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
