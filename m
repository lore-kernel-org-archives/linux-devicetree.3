Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4492D63E5
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161086; cv=none; b=BarBOSC3d1ZAbIEm9YREYwxWoJEvI8gBAaqhkn6Y73gWFLljznGKvmr2NQJpvn0D1fNsfskcw1zYULvfT3CgpLTWq6pjwmEW/jgZTdax8i/Oa39ibiAp42UCOV9/IMwDtc+fUAzVHJKRRYV6vdXGg1prjLXQDgXXRDrQqWj4WMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161086; c=relaxed/simple;
	bh=8TGC6zpIcTNPtMXhimEj7RyHbZDgyWcwozxpYcZ1MmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b4O8fHfHdlorH6mKVWlWw/OeNlRlnTLV/Hp/ttlTg/EMfhZJe9HXMbIwUNCjD4yuBO0Yg4OGhwLyD+VUDhdWCaZhZJES349Yhpu2EZWSvyLOKF1uGLZFOPMa2hFmkVA3hilKQh+ozEpbbM6IF819CYEow2zYZL1I2PxM401yCes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N1xX4Fyl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jdTT+nJL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N1xX4Fyl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jdTT+nJL"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlnOg856033
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CeUPngKv48iUX9hf1+kvn5eH
	JFECQubuuQ9wD170ztw=; b=N1xX4FylSSyWqscyDSQJqtFfoViqB4G9GYbHfYZA
	JgSE1TWQWqWWW5bzM7esPqUHRCsapWqxATO8yW46OoUzlX49MUl6oGVCtbjDT0T5
	dNXBRpIeEyGP2yaRrXkpKVgyT0pN//voZ3rS1IXteh67ovjWSEwnzHgyRcWirS3/
	YSw1XWoHCkUN6/SIRG4w9V7+tE5pHvn4Sa16dgMH2SUWakEeu8rZYy9EYVi4Q9qa
	E3KJz0JKZaWkunckG07QLh3fNa4MIVrA6Oj+TsofwnnCsIbzl2VFmtdQpy7Y89ns
	ZAXZDdchuU7EoaQoISJpmJwf786lsw5OZ2GIazTaX/By+g==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fny9wj9du-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:04:44 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c113ce8f7dso2818093e0c.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785161084; x=1785765884; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CeUPngKv48iUX9hf1+kvn5eHJFECQubuuQ9wD170ztw=;
        b=jdTT+nJLehD4ebH2TAUUXYnli/uqI1A2tDXaZ8vOzoxYxk0aTq6AiJ5pBCSCv06lCp
         qy3vj1yOIZ9vO4tAFl/V6aqO7AshSD7mYwJNEcPn9qOHPUwL3n7lVCbDoZdWpGXzXkQ4
         RmKZ5y2Gjs5mZUYYhMA4h6NXickbHDBHXkb82VSsMXOC3Aw41qNz+f5Ajjc68iNQX6Jr
         y3zAV45XPKEkJqhOatulCKeZ+lh21PJf0emONewnaRq2b3N50awTRETqpgRXeVSgiDzt
         C0oYnahBgS8jzGzU+0Cb5Tn6T4z5pKLua63jJB3zUH2KrdloVU8Dh+iYiMjwS0Sp6ii2
         oVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785161084; x=1785765884;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CeUPngKv48iUX9hf1+kvn5eHJFECQubuuQ9wD170ztw=;
        b=FziQMVskEb8dNUiTYpkSCxuw9TMEYvJI2B+IXit3DkNI8RXTeLA/Or0iWXyk3PFMlo
         lLhmqvEuM9t8E1oonPaPYPRYCy2SM/pLrN8GskenUlNMk+ErA/fskz6L/NbN8xPDEWjX
         NU1qJ38g5qyx2k5djIqj8Fb8Zgm1ttfWtjTJRmiTwK8CWn5ALGWZhw5Wn9DgGx1n/YR0
         4pzj9c/JvvP9SUUaey/I0aWAbmzlJxVbG4MSXntf9g14uJaeoHMYkhqtnwLKEqodEyIg
         GjuY4ZTBtudO9ZzoDwWHRcPhB5HCG5Sljygk/KbvYmSyOyJSP31dNQ5feRxL6f1C00Yo
         ynBw==
X-Forwarded-Encrypted: i=1; AHgh+RoLNE+M6i83adyDgqtp987Hx8p7hdnucUOuPW9Fk2EcOCIlhVvHDdaVnxrwTw+4WerCB2V7GHKozGhh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3K5QQl1DYWiCdE6ciUt1YTn644VUNoCn/wj8Hcu9F8x8VdBYI
	PRW13a+1zkF8x2Wdq+UKrn4oRz0pLJAo2HZN6rr2tzKal0DpK5R8V9tw+LO6yrHhxrVfKlGSSH2
	3n+vtB67bzx2fTkDs4g9k2w7ECy7gxBJCec7mlOuEvMgP8kR3fO1HLE7HD55+W+OP
X-Gm-Gg: AR+sD13/f6TrDyLyrfE4z4Nscv7tbm2BrsadaWagXcOg9IttyLd6YwmsDhaKk/sVsjx
	+VmVsk1kvOG226XWmKK+6xRSeTFUWPQtUHZ4WMM+WS5UeDQ3OjUCS4HwNFVNZxH7aF2Ft+whjVM
	X4foQAyBKtt2LY/oJmHapz9BrrDncRZD5hGluO9onqFCeZREMz7v4ke2ZVT/sQlyvG36uSD8ELt
	S0rehPWQQ9v7Qg+ssdUgxrcB1ml8/vlVoNCJwGlAKNNdCQ7g/IC2harAHNPi8z4SikN+hexVnS0
	e3ffC7EILmnVbMbwjzPZ6TmxRzoKcwotj2HPXpEEQlUMun4GyGdNofnovERCZL1yGweNKAspMb2
	/GIDyZnH+NplDWsg=
X-Received: by 2002:a05:6122:289a:b0:5c1:31ed:157 with SMTP id 71dfb90a1353d-5c306d68eb1mr3846410e0c.13.1785161083855;
        Mon, 27 Jul 2026 07:04:43 -0700 (PDT)
X-Received: by 2002:a05:6122:289a:b0:5c1:31ed:157 with SMTP id 71dfb90a1353d-5c306d68eb1mr3846364e0c.13.1785161083335;
        Mon, 27 Jul 2026 07:04:43 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4ed5f93sm360241405e9.1.2026.07.27.07.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:04:42 -0700 (PDT)
Date: Mon, 27 Jul 2026 17:04:40 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: kaanapali-mtp: Add s5kjn5 image
 sensor on CSIPHY2
Message-ID: <eedzydcytcmppqbninukwxdfnxnndmpjmmgqe35vc3c4aq3ntd@lxnu5upcye7o>
References: <20260720-knp-camera-v2-0-a21c3f0ecd55@oss.qualcomm.com>
 <20260720-knp-camera-v2-4-a21c3f0ecd55@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-knp-camera-v2-4-a21c3f0ecd55@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNCBTYWx0ZWRfX0q4Flf8MBtR6
 QgvALXuOsyMedzt7+G0S/M1afP+uL65Up2cIRKWRv/zkhTxSYSHXDThrM40afPWWxdXoQjdAcOC
 Ds3upgLzrb48dCKkXqWDfCA/YM/9U94XPivxP9plysmOIPR+/ei0PqJUdQD2jSFq5TIcOxcLZFI
 DUTD00qNfei6e3Eq4Z6gYXw+HPOPk+ucjlVYpkZEPs0BI9z05XiEG5N9RZGbZwQs9i6vspInh5Z
 ojV+MYzrq70ZcozsxLo9zzQneLbh+t2Jnk2vm/cI7xzYN2Pib3C/zkouVClNvNTZ+1BGpZG/1i0
 rzBcUZZ+jDCK0YWW8yUXQIauc/Eoizo6nDnoWx053X3qtk8Big7C0zgmck3uCuOyXNqrRN4kant
 tl+LRrIf/y8u9z3xLZR9OkIfC7SYCd+RIZ4r5vGot0HVE105r88CC2RhEJHnQ59oqod14PNYNg5
 3dwKJ22ydJy4WRjZv4w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNCBTYWx0ZWRfX/f0ZFgIK2c5F
 qaFnTCUVy5jGgdfeFnzQ33jRhvNpMYnmxhv3Pc6nxjF/IjuK1b8fEHmLGuxjB8a/Z3TtpfV5wZC
 kHiR1qP3kWC1qibVK6hKQzvkALkWPY0=
X-Proofpoint-ORIG-GUID: XyGvwn9DdIUBDSb-ET9jSxntl18n3M5B
X-Authority-Analysis: v=2.4 cv=E4b9Y6dl c=1 sm=1 tr=0 ts=6a67657c cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VaL2IKI0iZHC7nxK__QA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: XyGvwn9DdIUBDSb-ET9jSxntl18n3M5B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270134

On 26-07-20 21:57:37, Hangxiang Ma wrote:
> Enable the S5KJN5 image sensor which connected to cci0_i2c1 on Kaanapali
> MTP. The sensor appears on CCI pins connected to the CSIPHY2 interface
> in four lane mode.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

With the comment from Konrad addressed, looks good to me:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
