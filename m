Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009933;
	b=2q6gpOaM6CtSRKqf7gFgbMe3A6Iy3oMRrVnCiHwlt2oW1xncGISg5dV9J6XJPTllmRS5
	 QUunCmN907skSugRpNzCFlnYhRarOUGnXEXFy8O5QLQGE6pCzH7vrWM6HDFx8tuB9zrxO
	 As4QI+ifzPny+0C83CmdaerFAcdrI1Z7VC5jbDNUpE+ETOHsu6p4KnrHDD2xv40Fq9wTP
	 G0qbSwUwhmRic9bcj18CkS1Pai70wIPAfenirBTeQW9tbT/rChAWDl1HdZvmOnRDxtNBC
	 FCWob6xySGmUQfm1YJSjj/aXI/a5AfDBljcN2q1hUA+qBxvlReUYw09YfCs3Uk2SgaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009933;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XGaYi+CsERuIoATe1YOs5CL7UhAoUUf7A+yyeWfNMes=;
	b=nm4eXUO9vluZI4EuSNvVlQnY7xIcDbY6UMq8d7wx+7/ZWoQPh9Wm7GVfLLRQLRCjThHq
	 3yms3st39hiq6jmklc5c8YF7P7mW8aGcWA8/7TzbW/mPG/ReKYtQaeXB9In5XbCpvbeWn
	 cZfiXUlVEhRZpqJbgG4ZAIjgUyR8pWh4VXDzZKLMkgTiY2idAcqNDg9ixruyaQe7o4raw
	 YBU/z+hgEtoj0ze1dXLLY482NhutdK/LLc5oTknwvPxaVKcOXMwopTWAS9sXO4X0TRkdP
	 l2U5g+IWlVQDvC7NoKmjs9tFGaxBv9gbuEn5D8kVqCIVsm1JlO/ticnuR9VLecBi+JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="DcN94e/+";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A3CbiXdu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FC7606A31D
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2FC7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DcN94e/+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A3CbiXdu
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aq271181748
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:18:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XGaYi+CsERuIoATe1YOs5CL7UhAoUUf7A+yyeWfNMes=; b=DcN94e/+5R22ZwDE
	2ZXIXdMrZ2u7Tc7Q/T9KcG66KQUrr6W72pJoRHTOOdl+ZM93oqNxR2qPxYBFlIS9
	qUJlV2Kb6LPwPr3Pcsuv8MFyAGS2G9lkY2SE9ZauIHmXOb06AWS20dpAugMpFNLP
	ocgWi3qWOYHUGR6q8Cd9ZsBygvQXX8Rha9NoWu7bOvIMHlhVwg2Igh0Tpm7/elQX
	3MZ529TjU6WU0KivVvLnap+BbnvErNDPhVNXmxoz2Qt6ArZxPqv6IbvPrir0FsW4
	XgDAC3CBi4DcPQDLp4cZ4TTZjrhQP+IteVVMYZz3hgOEGaohgi1ief8o/dmAAQ7e
	pFxjVg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27ww4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:18:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1440e081so36287285a.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 03:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793009931; x=1793614731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XGaYi+CsERuIoATe1YOs5CL7UhAoUUf7A+yyeWfNMes=;
        b=A3CbiXduKfh1fqXKtJ5sDp9FkuEcaQ0lXEA7753RcIjdX4izFdif9biqtFdxDuZcz7
         MmzMmUF7tPFVJm9zHFiiidKLEZhpoGs2dAaomjeHI5MchUt2wZ1K4z13nao/sfK0+9/F
         hNj+HEUyBJsU8EJOH2P2Tdey7yEoge/lJH+JMSixsXFlqkzcaSh7MwVJ3LE53/cpqY8J
         ox2kfpDgTMkVQ1AgYgFZWcKTjquZfH6DGlDtORWqFaI4qG2r15V3uh923fzMfc63IVBx
         xb7alol4DGjyh+ziJm5Kgzd05nwi9Z//TUCi8oXUlluWm+36rtXco4enBhn7tKJfYja0
         NyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009931; x=1793614731;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XGaYi+CsERuIoATe1YOs5CL7UhAoUUf7A+yyeWfNMes=;
        b=C79dgyN/A0idr9oxtQ0vWrs03iO/PyGFEm4uzFZcXFFoOOtHkoAbnl7CtWBIsdB/LW
         I7gVkbCKM6BcPuZN5p8cPdtVRUhCuOzQz1c5Bv4pRcS0WXNMjnO4fryfUibAxVBk2nOD
         tJBarUrJEEd9ydIuU2z4IR4DPRZCsZRy2L79HiYp0tYs1ymVMWEMvuBOclUGrReqdLjq
         Gi4/e62VxT3TTGbxFbzjnFH0uGh5SBabh2F4iiunPitjSzcO+OAVqgjTsiHf1kLSyzb6
         v3EG+4HoQOt95hR8TMjEDkebcUp3GqSL9yO3F+Bn+FiN5aG7erpQqtqQY5JGdXX8UZjw
         elOg==
X-Forwarded-Encrypted: i=1; AKwUvBxEMdF4hCkWeoqlA+BDeIfXv5LwGW57SKffU+TmPhJl6Ol0hhagxdB0fvgQJgApj1c6PRkpvh61oQVn@vger.kernel.org
X-Gm-Message-State: AFq9FYLloZ8u95eoybWK/vlSb5O+zLs4NUWjwtv8s1XStVqR8BlOB4oY
	eX+MYU/RXL3kdNgbpc45Fwys+HQ2HboqwmRmb5RW3Ld9HjVZQC9INatgZQExJp3X0WzgwJ9vr9P
	9Xb95+CZM/sNNzqvpvAWSjPlGvw75PtoZCLtb1layKeJmCUlJ1zhSadJRJSDju4NO
X-Gm-Gg: AYBFou35Kgj0tSB2UUPEAFYwKIsMKXanFMh8AgURyr4hV484UppQvgDBqXSzoF2/bZN
	csrtqS57csSeNuyMPN9NAznn+SOX1z8iPX2GePmVF0RYZFWCCb3uqMZtzNztvH2rLVFSsPLIvyi
	RuygNi9PRffIw396gz1v2rfUhbIBi4HOM37IST03T2v9jQhOr1BIcZHZ7FiUvXXowHxpbh4oUdG
	lc9YekdCQM/t1xQ9YOff9IB4lTwed2o956chc2SBSIG5iSfu9TVdEJ0CJjvKaZ2mMR00W7smRUl
	CVyTYcpd/SswaL3KJvkUBde6yrR7Dx8pmKF9BOx4jKghuojc/YudmgwbtF2PFy9IgpmojNTiThj
	AjMoVyf4IWteeVnYgwFJ17w==
X-Received: by 2002:a05:620a:7302:20b0:93f:211f:7ba4 with SMTP id af79cd13be357-940ef945ddcmr917023985a.5.1793009930924;
        Mon, 26 Oct 2026 03:18:50 -0700 (PDT)
X-Received: by 2002:a05:620a:7302:20b0:93f:211f:7ba4 with SMTP id af79cd13be357-940ef945ddcmr917021885a.5.1793009930552;
        Mon, 26 Oct 2026 03:18:50 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd34f874sm306584266b.9.2026.10.26.03.18.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 03:18:49 -0700 (PDT)
Message-ID: <fd712bf4-6854-473c-950b-5e0fabe1947e@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:18:46 +0100
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
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add Motorola Moto G10
To: Michael McAllister <me@michaelmcallister.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1792840208.git.me@michaelmcallister.org>
 <1e50fab3692cc285621b2ad4a674dca79e5391ea.1792840208.git.me@michaelmcallister.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1e50fab3692cc285621b2ad4a674dca79e5391ea.1792840208.git.me@michaelmcallister.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6adf290b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=JwJ85b4fAAAA:8 a=EUspDBNiAAAA:8 a=uu7B1lnH_z2CDsybQgYA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=PEH46H7Ffwr30OY-TuGO:22 a=qg2vb7sgHZQYDKbllo_a:22
X-Proofpoint-ORIG-GUID: 9TFZCMYIp498mNe31qDdaMCCzLPT4nmS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MCBTYWx0ZWRfX+hIK3jdwN4a9
 TgO3ClvJWP+nk4qOGW3+usMl6QQyxIRCZz9Vgnai/ZFuouVvx5rgbXFSCLGr4lQ9ip1NlQm0fxu
 jXHhwKeI+G9RePxFnbsEk91l1zTfGF0=
X-Proofpoint-GUID: 9TFZCMYIp498mNe31qDdaMCCzLPT4nmS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MCBTYWx0ZWRfXzwBzoTsdKgQB
 uxuFmgpJXMGd1XBq5eOxNY7yU36VQ5u9zBHsTTfGCX8mobSttLduzDbQfpsmuTzGfuv7FzndTxy
 E1O1t+Egsxy8HaCKFteIEqLbfrN8eUvUDfryuy5W1Ui7jm2BCXf/tjzTY75935gf5kHXeNrxtFz
 3PEJb0j3/+wkxvpUeuPFQaEjXzRs6c1Majq3trUR88xlsVvIEv7KSmVWgLsMnZSG6mLw3WpMfWF
 2I3cn7esSwTe4hL650CDk1ZVaMCu9bgeemlK41+qux/w3dNLta5GQkVupAnv3PlsIJFiDiP/r8O
 tJ4i0ClNulwp6bzPztybaXWNNluRDOdxzxc3FYtlJ5Oj7RZ6g3Ww7vMrG2ewhQDuuBx8OW/301A
 ythhhUWBzpLMg8q9gMl4X/oEj/uomBowJyrNkE1BXD07/svbw/R/gY9LEG5bDh/mUwsoEAKuaBh
 cy7iYH6RjcioNMiCegA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260040

On 10/24/26 1:10 PM, Michael McAllister wrote:
> Add an initial board description for the SM4250-based Motorola Moto G10
> (codenamed capri), including eMMC, USB-C, buttons, GPU, Wi-Fi and remote
> processors. Describe the board-specific firmware carveouts and use the
> shared PM6125 and PMI632 definitions. Put the modem, ADSP and GPU firmware
> paths under qcom/motorola/capri/.
> 
> Use the firmware framebuffer until native panel support is available.
> Retain the GCC display AHB and AXI clocks and leave DISPCC disabled to
> preserve the bootloader display configuration.
> 
> Leave Bluetooth disabled until the WCN3950 shutdown fixes are merged.
> Panel, touchscreen, amplifier, sound-card and battery-monitor support
> depend on separate driver and binding submissions.
> 
> Signed-off-by: Michael McAllister <me@michaelmcallister.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
