Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0633B6C10
	for <devicetree@vger.kernel.org>; Wed,  8 Apr 2026 09:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775642402; cv=none; b=X4OGqjLq4Gzx0mZmgSI3y+FmHXX1NVfOMSABdHNNT7vaHZoDuFwQcTDbzPrO34Yc0Z+Doc/QSRBqMAj0nNS/LXOno51FIWQ46XBwFkVk37ZogpcafTInLFTCY1LwmKXY5HW24kxqfCx/p6IGbVxyE65RY/J1DC0fugeHTifZd8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775642402; c=relaxed/simple;
	bh=mBi8lFLIKMzICVhQha7ak23yOXt3vD3HD6QrPuHi4Es=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t1/HqnqIIQKb9Paak4GA43FcsTZ0yeA8Omyqg9Rr62GBtzBUoiUg/HhPm7h7mXtpWScSONLMi3vckp+2QssJF2mQDP32VVOEdK7k658R+wbwQTkOZnCAT1IrWStqCc+mdeQj2tYeqxZLN1q6LbualrB5tHYet2TOUahTamxxVnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CDswb93o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SwE7puP6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CDswb93o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SwE7puP6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63879LHs2861188
	for <devicetree@vger.kernel.org>; Wed, 8 Apr 2026 09:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y8yc3SWGU0L+F0BGHaW8P53Qu/1P19jf7doWt69XljI=; b=CDswb93oo4dExRKV
	p0bg4KOuTsdlVXIkgmMaSPIJCYP4W7sVZ9PVuUDmovMg6ZI/QN94WMZbMMD6YYH8
	JDDpkZVbXf8xeBXLlzGfepboVrWmwdffBqCh+he0/EE18hZHrnpM/4ltDB9yhSCe
	sJmWvdgiIhZzEmTEatUABFWs/4mKzlJHsOjM4Cy2NAJr9huSwvlZC7Dq6hvsJMPQ
	sS+sJCKcUevFRzdXc76WyT4VfvPktw6U4HbWAanaFH3HF4ruYS+5KHjD7SHWIjXN
	tnPrgJFuDZK2v+44biJ3/YCnlSPDxbKlfbRhqeAV4GOyXunW3JqiHKjuvK+3Dw05
	GzA7ZQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddad8t6sr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 09:59:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cfd003bfe2so154306685a.0
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 02:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775642394; x=1776247194; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y8yc3SWGU0L+F0BGHaW8P53Qu/1P19jf7doWt69XljI=;
        b=SwE7puP67RB/ZMJqfdqorvY0HQj72p1Jth00BA/gvgt3PL8siMHpdw8E8X2SAv0t8U
         fbrKCwhpyuKi5w+bj07uOgShYfgerK7uwYjZJdVWyPulXlr3hn6rpRuPrLGaY4pDFsmj
         gCAvFLcAltcz1w+qMndTRUS6R/HrSqa5H0Gnf2y+WtBhJhGp4IilZpT0IqtZ6fAkyLCw
         fe4RmroPJABiZxjFqJ3SYMPgLti2UmiaKlvpyaOW5laAgCBHfxRpK71BQ0w+hwpLTbSP
         x4mJ0fqAGPi+g2kbddsKNoNY3S7BXRTx/eJ9gXFhwZHfCKyYaRS5eHdhVQgDqAg/vl/t
         fv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775642394; x=1776247194;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y8yc3SWGU0L+F0BGHaW8P53Qu/1P19jf7doWt69XljI=;
        b=IyjHtuGA/+cGIzc9fmEHBB6vP8JJHRdy+kAm9VPt4co9PaWSWqTqBFY6tbJqNH13Bw
         VUP7C74SDPfjjFVP2FYqLxN21iB7Hz5PUv1z34BrTxNMJ0P2BUrA8C3cRSsDFixVWmEm
         faqvwO4oXSNM37QIEvI6hH/Oe9HwyUBP+G8xT/Yph3XgMz2n7gvNcJHR8n5jG5a/tUni
         koahYZAzxy5HfTc9OEyfbmeEABVvWL0HO4VvQmsDA+GyokSNhhwb7yHdrUz2dFv1rqLN
         6o88HsNYigNqXjYxoy3NFgJb8SkvZN2aYqIUwPwX/O62CIhY+FmUrIFkC9mWdGEBtfuf
         sM/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWypxvFveRPmcxRCylDUeWwVrCTRfeWxzmwvlRGtiqrULFdOpt3BCz6M+DrlAxnwK8l1rE5pCsTEzh7@vger.kernel.org
X-Gm-Message-State: AOJu0YzJDOqU987R2ypnyyRdi6ngDPSsCVsv/a1CII+sFm6OzvZq+cYt
	mFJakyCbHn5srSzpwX9OZWI/zgEm9PBFhRnvFbCDfcLw1NNMXwPzm0aEgu2qOCL5RCOlyZKjszX
	wwU4KZA5GN5UMasABnxoXlJCBRveIm9uWgUE+R1JYYXYJEhXnDvoIGSSd4T8I6+tX
X-Gm-Gg: AeBDieutHDD3aIxvx8gnpYsHz+2l8Gl9aP7Lkok0tgVJNqRCqFiB8MJTe3pSdpBmjKi
	GiB41qPqPuXA86LsF8zuD4XvAvOS4disNbr6qRlI2zhVIYAVUdkgklZYDJx/c10V5Kyz8PiT/Gd
	Yq2ccpfyNIHS+QXy2MH+b2qPD8OtNFmiyqCYtnWEkU/3rkAKp4wDARnV13ArvCEe+ry/h/vaxot
	Z04wNZEhlMunEVJ+xyM5g6gkPdoLoUgvH00M99mOGToBIQQVYEXEgiUELISIqI+HzifLkKqb2sO
	2PFY6GD+EpZmS/IVHN8zSTE958wl04dRZAV3JPDRYMSrcKYQeDrcHSjg/ikc5bwTX8PRObWtf25
	70vPI/jyXi9dqV5LNmXRqoDQ5leOduBnYOPpfcN0oG/7yVbFs7V5ciSoEYeE/+/+dgDwiEmqAl+
	E5VZc=
X-Received: by 2002:a05:620a:2682:b0:8cf:d2be:5796 with SMTP id af79cd13be357-8dae2489c96mr319301485a.6.1775642393451;
        Wed, 08 Apr 2026 02:59:53 -0700 (PDT)
X-Received: by 2002:a05:620a:2682:b0:8cf:d2be:5796 with SMTP id af79cd13be357-8dae2489c96mr319299585a.6.1775642392995;
        Wed, 08 Apr 2026 02:59:52 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e034b9284sm5221704a12.22.2026.04.08.02.59.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:59:51 -0700 (PDT)
Message-ID: <1f6727c3-d10d-4f04-9492-2cb99c95d1d0@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 11:59:48 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] pinctrl: qcom: add the TLMM driver for the Nord
 platforms
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260403-nord-tlmm-v1-0-4864f400c700@oss.qualcomm.com>
 <20260403-nord-tlmm-v1-2-4864f400c700@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260403-nord-tlmm-v1-2-4864f400c700@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: e6iipMzGJjzTxnVR3hfNgIsGoURYL09T
X-Proofpoint-GUID: e6iipMzGJjzTxnVR3hfNgIsGoURYL09T
X-Authority-Analysis: v=2.4 cv=EoDiaycA c=1 sm=1 tr=0 ts=69d6271a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Zw2ZyFplH8TUw-UW1mcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA5MCBTYWx0ZWRfX/oSeZq7S6zhj
 G/aDq4j0Vz5HjVL1uuD5f9p5QHgR/QU1gfdDDd4w7FtOcV8ZZFuiBZ+5L80fsZgMFL45z/kuHTf
 EVY5zJiwJ1fjRxd8sogoynbbzMIpSTwsZ97OSkKEFBvLiFevwmDez6siMWtI/O5EC8O4Y4Wa/Mj
 IjMx+vas3VtSC/QRvya/elyqZds4cGIhGRIR2ktPhjEqt4a5NexstcZeUi6PLIm1Dnl2u82CnWQ
 OAVoYYwd3cAwisyisKvmvT+IodE4WLC/J0JXHOAwokpdzL6CZutCEC2UtuSWGOASQ8Jm/MzALIK
 7smaKKU1Fbt3oBMTEvzNdK1HYUZVXMUbIptfQRNnxQJanBCYOujhLUzDP26ujOI0ZfPGl4G/Npt
 k0eRG6OXbvKx1ZScuHenOtHE8zqTxPTu0UGjRKP1krLrd+DGvw4j52/7dW8r0b1SIv+7MMic2yo
 /Rr5OI+9k6iyT3jm3tg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080090

On 4/3/26 3:27 PM, Bartosz Golaszewski wrote:
> Add support for the TLMM controller on the Qualcomm Nord platform.
> 
> Co-developed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

[...]

> +static const struct msm_gpio_wakeirq_map nord_pdc_map[] = {
> +	{ 0, 67 },    { 1, 68 },    { 2, 82 },	  { 3, 69 },	{ 4, 70 },
> +	{ 5, 83 },    { 6, 71 },    { 7, 72 },	  { 8, 84 },	{ 9, 73 },
> +	{ 10, 119 },  { 11, 85 },   { 45, 107 },  { 46, 98 },	{ 102, 77 },
> +	{ 108, 78 },  { 110, 120 }, { 114, 80 },  { 116, 81 },	{ 120, 117 },
> +	{ 124, 108 }, { 126, 99 },  { 128, 100 }, { 132, 101 }, { 138, 87 },
> +	{ 142, 88 },  { 144, 89 },  { 153, 90 },  { 157, 91 },	{ 159, 118 },
> +	{ 160, 110 }, { 161, 79 },  { 166, 109 }, { 168, 111 },

This list seems rather short.. are you sure it's complete?

And could you confirm that it's been synced for the prod verison of
the chip?

Konrad
