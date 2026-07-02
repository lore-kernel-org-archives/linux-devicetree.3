Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE59947F2CB
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 12:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782994116; cv=none; b=MJ5zkFXpYdra3uaFNCqScTsCN9IYyEkDKaL0n+BmsWvNNrMvPQ7+A1oOmCRq39PQH3VWIzjguERMUB5Vys4bqv9V8qQbAzqpG4j8DJUCPYhqvySxFRLAflysEs0Tw86/PF6Lazp/ccv93+IupHQO3HoxC0lDCiWuHHTxQOAUnJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782994116; c=relaxed/simple;
	bh=OjyS0thUu5O7Qg9fVyTOKr75ltIXN5gXWbAhELiCNh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PiLMNqb2yh3nF54adpBNQP+UA+zMRAyeF3Ooc9v+AGB26qGv/oRgEVbmC3YGM7EKT2aDE1myuAvh/VSI5SppYDnr/IIwjVPt7X85c02H+XqxTjZeBtl7i8ktj59e+illlh5J4x3EcxI/mZt0OoikbqhNbSfqi6Vbox4WzAJiiwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jXgYrgV8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G16ASHMY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jXgYrgV8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G16ASHMY"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662Ap7Z13485589
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 12:08:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iIuHmaYRX4lbic50IFffPPjJu1t85Ernr4S5yAwhhcI=; b=jXgYrgV8PCunms7N
	2UvgMBDe8JBr6M8RmEi6tfecR+BX8U3AywLpvZTMeb9iwHIaEVzQezxGQXBDECGt
	CQAjmvXa4gdF3Dj5xVbspW2mFLqppFbnNi/1j4RRm/9mMa+/LHJKoGZqNxfPzI5A
	IuAOgtp5iKoYnXg/6W2PtlF/APNoUEA705AnpWf5TZP3gaxYgxQBxlYUrq3ih1no
	eCloZGpByV0Hjd8OwL0pdJrNPTUkVACejMKDdzMhyMTgr2mRxOY+2ZMJTNzWWJoF
	eNYtuddpPAlxdTbOjuX3rfcwJ5WrMyleCJyV1ee6NoVwX5ZPHvgHqlqOsk1PZINB
	0T2dEw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h98hkd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 12:08:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c267931ebso6858091cf.2
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 05:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782994111; x=1783598911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iIuHmaYRX4lbic50IFffPPjJu1t85Ernr4S5yAwhhcI=;
        b=G16ASHMYGQRwTpebEsqaUT6mfmHwSiUNWghUlponNJiIR3hMEos4iTakMtmlhEYdpb
         kHkidasAbTEwGYPryQU3u9t/KGUEyMDJ7H3zdJ0Twan+N5WtGzNTDH5uXnbbX/TKAtUZ
         Et+XPJTsM2TOJy61rurRvvve5JchtsAuT9ezvim0/JbnGzwPRruOyrwrcfM/PJUi6DGG
         sTCTGevzgsa2Ba/1ydaTDVaXejI+eATUKCmwRHxANxs7SOyNqPoLRQeM4IDJ8+/QeMCM
         HsOUjmntas617vqTPYupt1Kpl5t3keyJb0ESgG4lYOWXQe4zkJhv2L1RHQnXHaqlfLqD
         NGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782994111; x=1783598911;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iIuHmaYRX4lbic50IFffPPjJu1t85Ernr4S5yAwhhcI=;
        b=lWzzf1iTcd2duszON05WKjX3iouJHzpBS+fABAXZ5asKmrKZ4gZtjhvSADhEi1VVW/
         AkhF15YGUVJtjbsBaK+1POGlhlhZInPZ+Y6s13uRy6F+B5X5czVyEDt+2DQ7+hLM/9Aa
         e0GjoaSAooAl61rHUhvqNeGgCzKBLpnMnCD47/1svnJ7aNED0nlausJ8f6MciqL2iebm
         PBcDmLKXoqCxV7+3Gv02Hr0HyUflXIyJ/f05un0ZwNsyG1a6gOJZN1RCKOc0pzj8byja
         QIHPOxcNFLi2U4YAIEwP5gBQeuoXjfQzzfpVYflvIRAYIBG/5lwuo/KTk4BXFYP0V9Sc
         ChBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/vAxtyeU6vAcYRmYjeBQI5bhtT92HiskQksxlYxB1N70LxmplIt8FREr45wfi2FAhxSFiFZ50QSNL@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj54WQVyLN20iVtPcL6XiEDXDusoJ9oj//mPWPckvZq8xYyotZ
	nQiKWmH4qzajGaDXh2zS5/Z4hG3m+tDlFZXEY6qSn+2g9vx7CsiHIWcZAAhTns6uJXbzbMGyEgY
	GZkas5JL3VLJPFYy2TfDd01jPsO3+PWfmAYH9OdmRCBr5W3uME4qQs93Ir+jMetBe
X-Gm-Gg: AfdE7cksJXfCJBxk/Pg1VV/TQ1XpU/eJ1YT6bEqHGeRRddQX8nb6XA9T40Ydcz/rsZj
	DJV1PInG0hrezFM26/gFnL6j/QznxVGJ0MXKOLAz8SF+i50YKic9vBdZ1Vd7sDCZvPouL7tL9uK
	w1LOy3s2PKOtT1hPuVJUrINF+QyJWxxkKYntpOkefQKbpVO8/87oSVdVRdvXsLXGVe7pIM84TG7
	odPoX0EzzW741rH1viSPhS1nyTAsmRclQ2N3uuiUVytaAvjn39ChKMaNh4qNDc0+tLQS+/kB4vJ
	nSlbTffzAe6j8dlWH343ILDa+fR9McKse21PbdATCg2lAW20jCyqb36KPbUSIWaCIZo239uZ4Ee
	KxtdFCvHN3e+208CLWDsJY6hkTg+u1Rkw86E=
X-Received: by 2002:ac8:7d83:0:b0:50b:2875:5782 with SMTP id d75a77b69052e-51c26b03d36mr54171161cf.6.1782994110474;
        Thu, 02 Jul 2026 05:08:30 -0700 (PDT)
X-Received: by 2002:ac8:7d83:0:b0:50b:2875:5782 with SMTP id d75a77b69052e-51c26b03d36mr54170781cf.6.1782994109918;
        Thu, 02 Jul 2026 05:08:29 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f5c52sm120457966b.58.2026.07.02.05.08.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 05:08:29 -0700 (PDT)
Message-ID: <b655782c-7250-4311-9822-f3565fea752f@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 14:08:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/2] arm64: dts: qcom: Add SD Card support for Shikra
 SoC
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
References: <20260702073354.3641966-1-monish.chunara@oss.qualcomm.com>
 <20260702073354.3641966-2-monish.chunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702073354.3641966-2-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FkZ3MgiSl5TLMZ3XPwEX357hmVDtYb_l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEyNyBTYWx0ZWRfXzEJy0Iu27QUR
 lzzu3YdJZhqsoKILW8On+bavbZHm7F8J9OVSWDDk3k5q2EuxrKJy/ynP+UTxoKMW6kVZHg1hODw
 2sNNBsffiA41skJFGiOJcLTisdkr/O1uLwQEkY2y1Qgiid0ljgyxXlr/7ZpgJmMRw7sJ7bFo2oi
 +8l5DSOX8vvIbx8cwNxNVhNaiL87ITZBHHdAJc6t2TqTgGDQ1k+tXwkaXN1O93FHXsSSCn1S7zH
 Jb/08dPoIbH3LJ6YV89iBvTmdblemCQBhAWHhs6htWLTuNmzTT77rXkKci+lT8BDAVTMVQSZ2VG
 CkuoWxmwflfPSiiUB5Wr3dcbyXYRkqbV/agBH7o1Ap+UdcsajdWbqLcaSzgatpDi5wJPKJkzyVn
 HyDYVoWt+NbmYZqF/yjUef/3bEiX+6T5U0TDsJpkItGf40ExIMnicihGz0P7/lwTaXB14p/egr6
 HiSIv57bVkS2OGlJoGg==
X-Proofpoint-GUID: FkZ3MgiSl5TLMZ3XPwEX357hmVDtYb_l
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEyNyBTYWx0ZWRfX3s0s6oBepl9K
 mhlJDwjGgAAUfFD1NBTYvADkUJXPTwjDQmXjL3aB2P70o9um69aQejgDrGBWeEjrozk29R4WTHb
 UPKsTMOUzwC/boMP/RUENJ1bHsDxSfY=
X-Authority-Analysis: v=2.4 cv=bdFbluPB c=1 sm=1 tr=0 ts=6a4654bf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=jlLNuUvImV_oxURiXAgA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020127

On 7/2/26 9:33 AM, Monish Chunara wrote:
> Add support for SD card on Shikra SoC and enable the required pinctrl
> configurations.
> 
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
