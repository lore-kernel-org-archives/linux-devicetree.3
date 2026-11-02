Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634623;
	b=Re0Y1UO7cJUkS/V9Lxf1fGNjSwUkp+3qM40bVvimWdZIGCkb+GNiaAQX/rjfn+P0ZJGN
	 biivKuyHcfYeze53l1y8VuurPc/cj6zmYX+vJc5E7tH77Y5aOYS41BG5XYb8AM3oDUS7Y
	 tbnMOfk5WU7mNOo+WhDWuPMeRvr6Lc74R9hX1XkcZM/Ok2aSH5cxD3mx7Wx+XjYi3Hf0i
	 blBglDeBbjG+/IHrEfnOkVgegfJ0TFMMz6MZgPBiyZg1SIBO0wOWcXTxiwYWJqsJZSznQ
	 w76/vBM0+6XXUN7lo1yecQ2CDOB/haCfHhMxhbS/r1Rax8CsfSzyEVVxDxyHtuRGWkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634623;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=41SuLFdM+OYIUOpS+13yG0AFxIaS8p+xKPVbpw71ahM=;
	b=uCGY/uzO3sCFDBPX0hqv/6T7piBj5vn7WYuqGZpLcZsLHLrQgEOB3IY+FwGDGvEDLDII
	 8DHdfb4K+iRJ/llCmwSvkN6H3zzYC57uyptgqyG5W8A37TQ3MQLaj7A2QKdUYWYhlDSSV
	 1Y+VWrV5BG/ZLdYt/Y3gXY2vPoYDX0CJtfNv0/Ocm8sfUmHTjQA2rtCgGapW0EhPg537d
	 rlo55iF8g3OUJWpNvPEGQ2fmX5Bk1utYUAFYVCgRRv++Ei7KKgNagqN1H9yitq51pyUAu
	 BJ0PHqvivI0GQcs1kcLuwyCjL/HoT2emR47uWhoHarsQFjxGyigkFp0UAXxdd8Zmtjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PwmcO+Nu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RoUPBwno;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0505606E00B
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 15:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0505606E00B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PwmcO+Nu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RoUPBwno
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpWg8477185
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 15:50:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	41SuLFdM+OYIUOpS+13yG0AFxIaS8p+xKPVbpw71ahM=; b=PwmcO+Nux2qBYjbp
	hj8NlyxjExt0jFuE55TaYYFpmctUOQ3Gz8Elzy3EPNk0+375HLoNDPE4P6jr/FpR
	bVI1Mf+pZQtOFZCJc4y/elaaelHmxNabH0qH9xUOjbtn4vqMPjPo4KzmKoL3jWmS
	FQlkJ4CdlOOQFee1l+OQXXQjvYqD4MoXEeC+Ub5VYJv62oDR2ao3pHG1ySvEsrod
	r2tkeWhKoz+68+2aax5sjk3Q5WOgv40mOkpD7KOieA9cKab30uyNV7mgYkGRHXSR
	+wqhihBqiq5nR/lprfMO0qkDzaOPBBLj+Yl/znn0cnmif54WozgHJ1s6nq3lpuSw
	j9qojQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph19y1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 15:50:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb6391e89so632534385a.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 07:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793634621; x=1794239421; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=41SuLFdM+OYIUOpS+13yG0AFxIaS8p+xKPVbpw71ahM=;
        b=RoUPBwnoEkIwU+hVxw/bSvuADsgUOShgaXgFsCGyM7kpCb22VNRsjmzrDFsJ6cyu1B
         bbCqjVPdZGadLo3V28QxRSkKplpJIG4gbjW/tNiK95SM7m+33FddtPGR9Ma4ekIg6RXf
         IhwBms4W5V5c2PfRvtxwkme/5OiU3OWbXQR8PVEaJrjQo2kPM4NtGWh7weCIkNRe3ekK
         5d9bA7Ocnp9Gxy/OFYwsmhx4GOGNmtOZP1NV2TiDqxpPwJRU8BdV8ClXBln5TNFIYlk6
         9rZ3kqOKwaYISBfRu1Q6/M7ADu12epVhjkkkSrrZAEIOlUZeInDQ7RS1uONdWBVpL/q3
         cA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634621; x=1794239421;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=41SuLFdM+OYIUOpS+13yG0AFxIaS8p+xKPVbpw71ahM=;
        b=JZIJdQ6Q85pGzV/5rEbqFTJuJ1mkp6U9VrsbctBBgomV/Dg65ctTNwNNxRhKfdXmDO
         ojjDEGGoMGGfqNm5JL+m4EDK4a1jY6oBPAcvy79pfzfSwsA6ltDkBdCgLMAVG6Bcj9yz
         o5p3NaWFVV68Eqs94YNyKOKANEUsf1+iik9SQRXmoAVpAodVfZWTC4VylTzpSHHz/pZR
         swjDBzS33BkyY4iqifTJVLRdZOoDPG41S+YPkMWUMrCyGSk9qcKOp7snhe7Z+d54zuX5
         +d4QcYXOiZBFrKuWkIMndJko8Wu0P+XlZKWFaL0UZMEcsFfn8bGY9ek/tDA/7lPz7LJT
         1ELQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLHD5ka7dgRhZAK9oQcMOdeSbrXHjy2UZuWGQLFpU0uKsYvjxZvmFkK8j09xJbPoGHR1DsXx78juaw@vger.kernel.org
X-Gm-Message-State: AFq9FYJLPzxg9eF5XGrIuwsEkWggaS9LQQt5eqppyqnsTd0+b/Nqo8ME
	UdqVkn0r/SwTkReFPmL/7Zsj7UbJPOX/WwqL1/3Y8oxR1+sW8D1vMby0L+5Ztlgar8x2nWHDeBV
	x+KzkcOluTKHXYXE96pva6Wbbccrev/Ariu6Yy8DBTNmH3eFpNWKaAQuyIKvt2IJC
X-Gm-Gg: AYBFou1jcHdb0IzWLUWFIbWLz3egtivicONKLFNgI6YsTl+9aUwP7EFsvbAckP+U8f/
	WKRssKY6t4p/V+Gs3yo/9iTLbUZv41ul7kwk2+RphiKsnae+sF/xol97vlZrlzRQkukxc9njh+G
	jhb867CMquHgrPCeozfyY5ih1/YOabcA6MmUAyDrPqf7X39tt8CpGUcLM5c3r7flMYAU9vNnri8
	CAauNwIJz20/yNIioU8OmMQNVXt57dSQQ7Qf3A0tlIZOshhgazNIK1d9I6BIi/DqdoQXketEZNh
	AlNplE68XD3OpQu9OpZIg0VvwUCkueJo0MftUULqNFy/omvgik9uCvyU4zztVadkPlw9i0OULcP
	wwzyr9+6IfFps8+yYSpLnEN9ZCGcvuyG31sBWi3Lp9tic5e3Euhfkk3xvyN6f/Kzus1Q0Tmvz6y
	uGTTReuMkHED5UHAC26XFX0IRK4qYpiaWUm9OrzRHAq6auBm0y60ZlxnGeMmcH
X-Received: by 2002:a05:620a:371e:b0:943:ff70:dbeb with SMTP id af79cd13be357-94421618787mr1723019285a.17.1793634620879;
        Mon, 02 Nov 2026 07:50:20 -0800 (PST)
X-Received: by 2002:a05:620a:371e:b0:943:ff70:dbeb with SMTP id af79cd13be357-94421618787mr1723013985a.17.1793634620321;
        Mon, 02 Nov 2026 07:50:20 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe0740475sm1825160e87.62.2026.11.02.07.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:50:19 -0800 (PST)
Date: Mon, 2 Nov 2026 17:50:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Lukas =?utf-8?Q?M=C3=A4rdian?= <lukas.maerdian@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        srinivas.kandagatla@oss.qualcomm.com, akhilpo@oss.qualcomm.com,
        jie.zhang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: mahua-t14s: Enable GPU and GMU
Message-ID: <ppc7kbhduxhams2pg5eh47gy3pozcpxz2ewunrzehemh4ajqmo@ey4ek2i4jrub>
References: <20261102142812.1353199-1-lukas.maerdian@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261102142812.1353199-1-lukas.maerdian@oss.qualcomm.com>
X-Proofpoint-GUID: Gmybkqhna300F2j8bIn3VLJGYq-S2GmA
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae8b13d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XXbD3vZemTXwHt2epcUA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Gmybkqhna300F2j8bIn3VLJGYq-S2GmA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX1EJb+HgWUT1m
 TVsqeGcYRq1GpqFmUvvvzuvxwsoLk4g/vkpySTEaYDczDWiuxQu74KjDW8d5ZH5SgM9TnUYxFYE
 tZkcT4UdmtOO83yfIKRtvH1w/L7xkecLftZ5b8+EC3UTYh9XDqqGu346YE4hmSUwV4PJDhx0myk
 iq0jMLviKk+IQ1Gv1i4HzE0fNzj6tJP0+IPxS3WPa271GxQzR0W2X40LjW2WDxwHl5QumtWLYak
 lN50CmHQC5t9efPw9whV3vWnMzY6i6ercPa5RcGCnNdbHr3E3fW4E3K5Td55Tu5gwXQjNj4KGB8
 7q0K7f6Pvpzp6rspV3YHcg2x7QyVGgc35ZMSfSgGYls5ldhrVpZ9FGQEAseEMOG1nfF3glef2er
 +mu252B4FFx/mUebb62M6yaTsqOZv9PY62+gj1FE7Ehf4HPy//s7Qm9PG5ZiIR4G+Dt4URV59Lr
 kdDIyjG40RDgueXNK5w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX6VTA0AApTeDS
 1/riX3cRgLzcrwZQUOXZAKy16dO9au5Ct46GIPyvxx5BjHjUS6/fprmYz827uw0dF+v/sYry4+S
 Vk7ild2yHF7equEtMa0zFRZSEtSrOag=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020063

On Mon, Nov 02, 2026 at 03:28:12PM +0100, Lukas Märdian wrote:
> The GPU and GMU were disabled when the ThinkPad T14s Gen 7 device tree
> was introduced, as the Adreno X2-85 found in the Mahua SoC was not
> supported yet. Until then, mahua.dtsi inherited the GPU and GMU nodes
> from glymur.dtsi unchanged, describing them as Glymur's larger Adreno
> X2-90, which is not what the Mahua hardware is.
> 
> Mahua's own GPU is now described: mahua.dtsi overrides the compatibles
> with "qcom,adreno-44060000" and "qcom,adreno-gmu-x285.0", and the msm
> driver carries a matching Adreno X2-85 entry. With that, the nodes
> work as-is on this laptop, so drop the board-level overrides and let
> them inherit the default enabled status.
> 
> Tested on a ThinkPad T14s Gen 7 (LCD): the GPU and GMU bind, the
> gen80100 SQE/AQE/GMU firmware loads (GMU firmware v5.2.38), and Mesa
> 26.3.0-rc2 reports "Adreno (TM) X2-85" for both OpenGL 4.6 (freedreno)
> and Vulkan (turnip).
> 
> Assisted-by: LLM
> Signed-off-by: Lukas Märdian <lukas.maerdian@oss.qualcomm.com>
> ---
> This depends on the Mahua GPU support series, specifically
> "drm/msm/a8xx: Add Mahua GPU support" and "arm64: dts: qcom: mahua:
> Support GPU and GMU", which are not merged yet:
> https://lore.kernel.org/all/20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com/


With the dependency landing first:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
