Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA76D34D911
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 09:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775814608; cv=none; b=MPL56vtCZXBO+cLvGnDProLAMmmXFZALwCote5DLyS7Z1XSVM1uNBSk2+A4NRoXTDsiLy0vbLokOwzEI60UUttiNs/UArmOyQVVcRi6gSSTer3XMAV+CfDBMcSx+CMsQlBFaQdBIniphSUb4o6FB6bljuZxKOylvkXhrwU+6aiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775814608; c=relaxed/simple;
	bh=ZOgaDu9aSzEXnezkQHCnvYzmskKgQSZu2tXTceCtftA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iJXVe0yX2hFZoEtgVrTb0Dojm1BQmgm3YmSaZm9GQY+vd19qpj+gsm+J4pE6T71V48PhoBqeHYrUgd9es6ikaapT88FA5zOG2ZoZ38pBglgzxfbYwqB7TtlcsG1BMbAQ2ji6Lj1al6Vi5f1TtKr0AwuSb5SzLKiqaJZNjQ3XlGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aehhj207; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X8caKVJm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aehhj207";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X8caKVJm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A7tk1K3934665
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 09:50:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l9qnOlbUXy+ARxkrRqY9Z2wy75lAeAnfzKPFDRUM6cA=; b=aehhj207mlGKbNEQ
	eSw+Bwtzs1ygwKBdQLErwlum3/RuiKbcajDeuVyiMZnGrUDuXhSpKZWvctkweZpu
	gTyl0Inp4MmB8rdNbi2xF4p3rn+WqdSBwP1Ndv8VG8hKKUSsVplGyJRYkkZV9yWU
	+ALFAdG+gjvJW9H8hYFmZl2g8ajSFsNMHxUb5E1lVWDea0208ZXTyMrz3u8Geilc
	jeFUmqNYD4NwK3qOMNoNtVF7UJOh6BNcSHr1gTACOzbEtmu7ahaJQ5oXnYtAto44
	EPn9zhDogvzI0HqnEGHPERoNGNtY7n6hNPkpCo3E+tLN9Q6i4rUUGjewtcpPj/1r
	w6a3FQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded5sbhkd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 09:50:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d63aeaaedaso48784285a.2
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 02:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775814605; x=1776419405; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l9qnOlbUXy+ARxkrRqY9Z2wy75lAeAnfzKPFDRUM6cA=;
        b=X8caKVJmSumku+6FHEaxhttmwk2peMfuzTep/yzXZ9WXLVCDESmm3nDV/ZLdxSmcgr
         DoxLvMeDvw/APjrbaYlBtpjG2/l0aYUaRTFgsgchyKLW4VuBKmiHx56q93/ayDe1Z1Ei
         sVwJ9fjm4MCG6Ld41wHcmo8w0i4cJ+99qgHICd37DnDax6EbUsFba5kKdpEFHcTZ+IWG
         wTWFJf8PdPgJ0wsYyo+HqLSquzlVkUIkHjeB1ofpjyyAQRPyLlrICaqEDMXK5xah+ggl
         2/pU2hRIlgbI2PQ7DP7Lar+b9NXm22T2qkaNIrHIVXKSIdtW+H58N/dAIZq3byeJizU+
         EOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775814605; x=1776419405;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l9qnOlbUXy+ARxkrRqY9Z2wy75lAeAnfzKPFDRUM6cA=;
        b=Obkkyzz3jkJP/Up6C6NprWt9wwVxzEa20Z0sGqbxE29UMhqE2qPW2U3lG8YoF/9FlD
         dJPQAckXy6fE/kJk23LUo5U4yLNGLC8vaVdlrSCV4AaIJ0+upjABL4L8UeYgxzorg3ki
         CJHwxmWsb5paYbkhom4GQ3gdpOY8tegMfKc9zQypYaZxmCinMG3Oy7Cuao+MbWctFAVC
         JmxL4hSztafYme1XYgHmavtq50mSD/coFdoMlWRzHbOdlKb8hzdn4Ev9Hv+X0fvmS13z
         lfNd6Lyoir0nLxYqt65XQAdVRXlGOuzukq8VtHrGMVdtZCoSiZovJVanzYq8OHfccom5
         1l6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWOIUy8gGxwyZbxbGIemQTbrMqhMcl9LtVEISax3WE1pmURfHQK4jGSyW0IOEgvizkeI34GdnsENFVX@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt1406BVRSqWNpG1ECX4Mh1u1WNyty2/AVwGKFRFNuNmMiESph
	QSfXeSZlyK1KQe018FB26YU4mRVQjcAEySCHFAo4v4IqTnRdANqPQG8uDB8hBnHXwJUWF68ykdc
	JjQRjFxMAqmJ2wMhJ0sTCnrrVNRpOO/yIZos+bWex6fvBaw9CX970aLcoDDVGl6nM
X-Gm-Gg: AeBDiesGDH/asA5wbMkDmFSvWtKwmzxuVEUtMRibjIKxYNOR6AZjXzKXHJGbtugIfli
	tdLnZlMbYXkWkGoVTnBjX1E4Qk7VrdhdyLWCIpKU0hmXXfNSzJ2Mkzdnie0EfNrwk50Cc7kPDzA
	nhiF9xEfMi480nStjl/pyXkTrLTDm9oGIqg1iyEAeM46w/OEHmMz4b+rNDbgu9KfzU9AX5muuvD
	3ZeT0j9l5gEZDJgTijM6SjySF8UW15pbhXZCtVZ0wAeLdZgcb72StpLpI6PDFhT6U5kb77IPz2n
	d1zm8BAzP1hk1P/3lsDLZX3Vg5W5M5sEMbaUQEVM17JLF209MYQwLT+goMJuJNqqB2AmmqSQGpJ
	Q9fTIiTgJxyP0DXNLIg4j2kKTUnWwbrJgc+thItc+6FPqJIReGSC9nnVS2po0BwocyZw0R8wi0U
	u7KSE=
X-Received: by 2002:a05:620a:3189:b0:8cf:d68a:9aa2 with SMTP id af79cd13be357-8ddcf7ae077mr204704985a.6.1775814605426;
        Fri, 10 Apr 2026 02:50:05 -0700 (PDT)
X-Received: by 2002:a05:620a:3189:b0:8cf:d68a:9aa2 with SMTP id af79cd13be357-8ddcf7ae077mr204703085a.6.1775814605023;
        Fri, 10 Apr 2026 02:50:05 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67070815d27sm408842a12.24.2026.04.10.02.50.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 02:50:03 -0700 (PDT)
Message-ID: <c078c340-0f74-42e5-a8f7-d92d5ecf33fe@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 11:49:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: x1e80100-microsoft-romulus: add
 PM8010 camera regulators
To: Oliver White <oliverjwhite07@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: bod@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260409083609.75341-1-oliverjwhite07@gmail.com>
 <20260409201717.108169-1-oliverjwhite07@gmail.com>
 <20260409201717.108169-2-oliverjwhite07@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260409201717.108169-2-oliverjwhite07@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KQX9hEhSEpRV9XSnuss7ZFRErXThlC--
X-Proofpoint-GUID: KQX9hEhSEpRV9XSnuss7ZFRErXThlC--
X-Authority-Analysis: v=2.4 cv=Ko59H2WN c=1 sm=1 tr=0 ts=69d8c7cd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=u7YyajWv_5wq9kkWYikA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA5MCBTYWx0ZWRfX3uOGoU27KU88
 PvWRdWnWcWTs+n9QxncXUI8HOigrW9YrhoDnZSrO/v4oqMJscAXdjQOFjEDlza3yNjvO2oaUhWH
 52q3CouA/ncQT7MOq/HD74dqT+sMXsEPDAFUbizCUhl+vCRryccv+HAMXVeeCRwp3BYx4Rvd8HP
 3M8VUAimBXIMlLQufDnmOl/JSZgpuxXJYscAypsyZTJNkGiCJ5hZKbOWhOzUuW+D6OY20XUO1OX
 sBk/lEpacN9M89mhXF7OCGpgaW3iNPRxilSdG6BbNUiNVCwiu7DXhkiYENR9SBeLM0IL0MNrzG4
 HkgvQN87286TiRdYSCfN42qs4o3qBWHh2i7NbygrY6IiHGkUOgA+Cvch9DLGrFx+TI8EzuIXfxu
 seVfQ1Iqgm/cHpCYuk2lj9Pr/goi0GDWOBchhoMcXpj+YLE7fXfzBYs7G+XOM93oCECiDfuqNbD
 XINHSk3IX1UDixEAoow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100090

On 4/9/26 10:17 PM, Oliver White wrote:
> Add the PM8010 regulator outputs used by the front-facing OV02C10
> camera module on Microsoft Romulus.
> 
> These rails provide the supplies referenced by the camera enablement patch.
> 
> Signed-off-by: Oliver White <oliverjwhite07@gmail.com>
> ---

FWIW the regulator config is a little different, at least on my device
that reports (in device manager -> cameras -> details -> hardware IDs
or similar) to have

MSHW0470 FRONT_RGB (OV02...)
MSHW0472 FRONT_IR (ID SMO55F0, it's likely a STMicro VD55G0)

All voltages are flat, no ranges

LDO1 (RGB) 1.2 V
LDO2 (IR) 1.2 V
LDO3 (RGB) 1.8 V
LDO4 (IR) 1.8 V
LDO5 (RGB) 2.8 V
LDO6 (IR) 1.8 V

LDO7 remains unused, and would be only used with an IR sensor that's
MSHW0492 or MSHW0562

Konrad
