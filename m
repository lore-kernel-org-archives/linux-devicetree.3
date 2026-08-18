Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8FA43B6CF
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 10:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787050183; cv=none; b=EOWaeeMAmYiOzQO68yc61m95i+HIGB9dNdxmN0pW+ACYEMVQmW+5vexLCLieyRiga7H+9SPyLwcHqcUcCuxZZ+H2waXZTWVtSYHJFjRMN2kfgoJBQLvH5cAQ6g4EMw/AHPe+N9lWAfp71IHpVFTQZtgIeCvjQJRzbjTXiPKN4CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787050183; c=relaxed/simple;
	bh=wC+ypGUYfg2ZJy+x8jlmaCau0zozazGRrQ4JBRhMnOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YgTc8UQaasTv7f5a5e4dTczq0hMU8sc21ic/XBj+nFAKT2P2xnW3WfiAVN2a6hQjH59fHcokn8QQTESBvpqV4n40bnwN2UYcRnPcUwN9D/HIdH7FbubJMaD+BgQepA6sAdnKekM8ECmuXhfjW3phBJ++I3boCAZnj7IzvdsjfQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nCRJDYJ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KTOnEAwH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nCRJDYJ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KTOnEAwH"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABbpC068547
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 10:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j5xGZx3ngSWevc4uMSVZ04XW44ndtdS/p1r5AEpU1QY=; b=nCRJDYJ/1Hm7rw5+
	Nx55iuCzspkFcLRIVb3BQQt0f4E7vbn2bj+Dsy43wjXgDFLDhsoc4sscT0pnSWWA
	E2nkKEgjugxSHcc1ytALa7eCNYLgxIwei9rFQkEcFyz5XBGitVFVeeYgeAYjo3f+
	2h9yHaUV4oUZr2W/nLoeVHZ3cJbvkRWePET1Lv028XKQqkqrtpc45eKb3FyQ0o/X
	afXEEw3cvyMJm4CDUzlZeQRs89+x+4EZMZH3v7/QMOhxjmGfSphwQKqiKGHBQS9e
	wsro3FMHYj+v+u4hWgVuxxpposyNeXgAtD88EE/OE98ysGVSpQ83k5GWEhlXj/YV
	Ozwg0Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4f5pssna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 10:49:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso44077185a.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 03:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787050181; x=1787654981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j5xGZx3ngSWevc4uMSVZ04XW44ndtdS/p1r5AEpU1QY=;
        b=KTOnEAwHWjVg8bUPhr8VwIww1YfqHEprzi5+BbBxDw+bDLOFRAV55NZLrSSUy/GZcv
         VJcHN0vqlgB59NTg+dKLOTCMp24C7GjVqCKt3Lu24vLF8lGM5EQY7AraX2t9ETB9A9Cm
         TQ64vQGTwDeWF0ydU6yhpoRJ/UDDmDtrbFZA3MPZJuF13JH++81hTlg5o1HLoyWaLBjA
         GqvNTq4R4NbfKtCej+REDrVO4SzC475tzbzox6UxPce0NSCxMIJNjmhDH/cEjWHRsxed
         akGJzA4fHfGJmElz9qFadM4PekuAMunNrFGUeHIZ6gie5y6O1Cu0EhJ+/75sEBwiFxFH
         3a5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787050181; x=1787654981;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j5xGZx3ngSWevc4uMSVZ04XW44ndtdS/p1r5AEpU1QY=;
        b=HsXfDcmmIfozlZHYE1z3Ct5uYA0XsDkk6k8BQef3QImxMeAFi5YXtD8dZVOvqIhUnx
         ywC8U69amsHume1P4dtDCJpzNxzwaQcf9N2Gbo5jwYbb05aaDHW8vO9qcXiIEEF+oAIY
         l2Fd0NWWm+ny/OVZHfOaov6Lv04Ru5l3vKmwTWxv3Lv5NwW+YStbITv2/6HUaOugGIi3
         pOIDWbAPDoFJLGeGntQ4LJSaAgWGP7ZZPPJHE5qMgx5/cXmCWdsPKLkdtbe7t5fae4xo
         bm+h9o8Erj/Jn5/4TiWJ0b44CUZ3Xp5f6HGImAhguTagov74EUzB6w4Er1sYlH0ckL/d
         yAEA==
X-Forwarded-Encrypted: i=1; AHgh+Rr2tuseq5DlMnM24s1RlSDXIKpTfUspdNz6HtyM9yGvRMCNYX023G3W7ieFIfdNhOUJD33v2/9xC97E@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2DRWEt5gIu3+MJKP0BspqIV7EV5lKPmPD78parUbbwm4AycaV
	Q2YlhH4eZIjaWPHmcwQrP4cF9IuveSon8iT1FdWeFwomT8gxhVrPj5X9PdQ4M2KJ36zpJHzJhY1
	bsdib65Vgxbu0X+nb3NIjC+UDwRgtt+Qktz2Q/kRNronUyiujGtKxtzOMPV8u0jI0
X-Gm-Gg: AR+sD12T5eXXwv8yStcf1C4BTWyp/HLMMca8EF4Hx55mQJHVkKt32ITcgCcDx6SsCGE
	6Nmp+ACHmNxk5MT8JhTe99RBOLBoHr4anAIZDXKBOt4L6mn7c/uI7Wq1O6itNT6mW5Uj7vlg81X
	xMy7VzPLQ/ab7a6QWVtzkDwBr9eAgGypjgeZUvOngERToAoYYd5YIePVxP6bnIXGrgIB4YSX0+2
	Mf6NcESzNYMYEUwRhB79m0inqk95FK9yIHQCIC2jdfiToY5BZ+aCOv5gw1MfclYPtBiJjOHqRXE
	n7janLgipC/676B9uLtQb3i0/AYg0sG+GqeXs0Y++i7ziZ6fmdvRnkDV9XzCWHcNDBEr66UaX7x
	hURkPLdUUxZQT6C4GU8egHavD
X-Received: by 2002:a05:620a:460a:b0:931:4c8:d8ca with SMTP id af79cd13be357-936d233ff1bmr2362203785a.1.1787050180888;
        Tue, 18 Aug 2026 03:49:40 -0700 (PDT)
X-Received: by 2002:a05:620a:460a:b0:931:4c8:d8ca with SMTP id af79cd13be357-936d233ff1bmr2362201585a.1.1787050180534;
        Tue, 18 Aug 2026 03:49:40 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b732a4sm136255866b.30.2026.08.18.03.49.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 03:49:39 -0700 (PDT)
Message-ID: <049be278-8958-4d04-8501-7fb60d2169cc@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 12:49:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: hamoa-iot-evk: switch typec0 to
 PS8830 retimer
To: Xin Liu <xin.liu@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com, Guodong Xu <guodong.xu@oss.qualcomm.com>
References: <20260803132753.994619-1-xin.liu@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260803132753.994619-1-xin.liu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S+/pBosP c=1 sm=1 tr=0 ts=6a8438c5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=0xWNcfA51jHuHAl5ng4A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: g9WEHwSTOV8D7ZOss51EbMLF64FhvuL3
X-Proofpoint-ORIG-GUID: g9WEHwSTOV8D7ZOss51EbMLF64FhvuL3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3OSBTYWx0ZWRfX/3u2kVYRAbBh
 0DeDApglmyul247KonZc7E37AJZR4qBp6Cek+0gbV4EJ7RhBygrXZq4Puv3E5XK+Rh9z5Kn87TO
 5qzqng0RL6vbW/nHVW+57ot1FTZUrnjr2dTiDwSBmKclGRc+5Zn2XF1s0lnfMXkIIwFK3GVnQtD
 3X3WSPPvQkKh+cO8CfHoPi+9boIsLstpeW6vsRSnsB1P/SErnzhD5tza51jHjWPdu1hHE73K1Dx
 G72clbGhZ0nNHvH60w2mfYm8fnTWl40tM1FYtV6z4Mq6CKiNWGKnNJ983elgenHk+YQQuoh66cI
 4I69LvEaES91PLzBlHuDKqjnF9S1C10MhCR1jBaz2/waGWUckAB7QZr12lbpiQktRihNj2Q5oR/
 9KAZOQqXhMOlSdtQjM8YNc6BKkNfq/1S1msv+/sOKZEZ9ATyqWtpbATvOPTKzKzT6hYD+bU511W
 3KFa3ZPWPsDmmgOw4UA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3OSBTYWx0ZWRfX56B50KPdVrB9
 nTD8AZ9UvSrghSdOhVk5MHf4/QnQ/5pKM90c2WeduJwIJwkOJrm3DN6Ss6FZ6Gh/rNR3wqFUHcq
 D3qlmzJSHrc1h1sccrBgcsl91qY5Sas=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180079

On 8/3/26 3:27 PM, Xin Liu wrote:
> The Hamoa IoT EVK hardware design uses a Parade PS8830 retimer on
> I2C3 for USB Type-C port 0. Describe the retimer and route typec0
> through it to enable USB 3.0 SuperSpeed and DisplayPort Alt Mode.
> 
> Supply the PS8830 from the existing vreg_rtmr0_* rails and remove
> their stale "Left unused" annotation.
> 
> The FSUSB42 SBU mux chip is present on the PCB but with all signal
> lines unconnected (NC), so remove the fsusb42 node and its pinctrl
> group.

[...]

> +&i2c3 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	typec-mux@8 {
> +		compatible = "parade,ps8830";
> +		reg = <0x08>;
> +
> +		clocks = <&rpmhcc RPMH_RF_CLK4>;

On other boards, the port0 retimer normally takes RF_CLK3 - have
you verified this bit?

Konrad
