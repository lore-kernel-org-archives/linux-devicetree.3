Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098338;
	b=aiAfT0j6z6VtPCktGjt7AfMSpIQzWAg+6DDhMyi1IBCP5I5sXoUu+phJ0tvzeWVsPEJH
	 L4KBBL/dwSY4HchXiW/w1JLsXJp/8Gkmm1xo3MjEjrSUaYJBLoBWLcZiFCZjx3JMhmNHy
	 Bt6TuIP2kXpPi9mgJ+7V2T+XGWMHCQphbys8VOMcutTqNxWsL5sCSAbyekQjbShU8eYoK
	 TL9eJpxEQKLhjep7vL2nlePSCG0zloEiRi6WHzf+PD50Yqf6YYOx7eDWz9fYLEDn3A1mV
	 dltvCWvVMCVsyav0ChEkAOtRSQRTVCtaVGRAqrlwXyb+S/UEkXB02pSvku7aE965Muw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098338;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=eQun1WYgrR9Botg96DTC22QuOkNDBYx1ZtyTIErbOWg=;
	b=pyioxEdaRolkhQR4rII2MPzs0DrHrXoOiVnpDX2aPc++e8mpjI1KyD4xsYD0AZ0gvcWI
	 dlLlk0lyRy831Su1s33l7towJpBc7OPZ8N69KyAKuT5Z3B7jQN6wikqdyxIWwo7o2K1qb
	 MmbqR4q97Y4vDkXf//oiRYpVCXFhhDuUbi/cTVi8HHASbu6PFyVQTNztu8LQOcCFh1tuf
	 C2D0iQrNlx2tkZLARcFnK/mTQfi5EFvqc8Vzay5GwvyQEiCCP4flK2Zh1xG7TI2z2+va2
	 QHRkbxNmVSU5o1mTRZNsIAxA+LuN33+/J9NiYCxY4j2HJ9P+iJd0rWlHetLvnyHXNZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="W3/GEbK2";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KmfWJ6ie;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4E4606ADD1
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:52:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B4E4606ADD1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W3/GEbK2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KmfWJ6ie
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe0J01614565
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eQun1WYgrR9Botg96DTC22QuOkNDBYx1ZtyTIErbOWg=; b=W3/GEbK21xwGnJXS
	7vOGHCPSKcQmQfrzNMNnNi+tzmjkpVrHNHZ8hgEAKfoorz4ShKHUsCjqvsI6wIOr
	u8iF2pFwfNCf11XiA64dBmMnLY2oC4vSRGBLEOIh8bp3tCTOq3p3wmz0BMLM4xYq
	upnzvYlo3X3AUyOZxAsHlk9CpDBB79dsSKeohOhT+9PVeeVrnxgkLOzCbZTvnqjA
	O9DW0DOg3X2qQ3uOZcJaNFtGAp7f74u/E9rMzi4wCk9FzD+6afDeVWnHJXkuyRaA
	4RgFM8/9wN42QdHgOKF71ff7/sZGD+Rc/bEf1v+staDwN34QqMUySMw/+72L4RTn
	ZFmI4Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5rsjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:52:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1440e081so53213685a.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 03:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098336; x=1793703136; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eQun1WYgrR9Botg96DTC22QuOkNDBYx1ZtyTIErbOWg=;
        b=KmfWJ6ieP52Y8xCL+h85Ow2r7eAcFoLY+5F1I9MdCbXvLRN1WKOeq6Ac6WAy3Uummy
         /VwB7gJS07mSMiqOMOFoiJIbi4wYEFJWgXSPTnneUmsoZXO9YSDiZbwGEPWmtX+Nlkge
         XiSVDlAGLdHjz4evPXIOMfDQrpsBE+MNxPWWLxK76cgEXJI/Gk32WDVxkVpKnM6JWEjp
         axAus/98bP0cDpHB9aK2I3yx8T4bg3JTKECYZZaiWWfIiRQTqPYozRLlwBqa5X+Qr5pf
         fuiw5WbhE4Ry1shsmVysk8EPKF4GzZyc1KmPuufJA2uTye+ktg4jdVYUG7S+OkpDG+n0
         z7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098336; x=1793703136;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eQun1WYgrR9Botg96DTC22QuOkNDBYx1ZtyTIErbOWg=;
        b=ofJTUo4KPDuWk5E1Zh/cE8lk4V7TzhfAAoru4zxrIrcH26bfc+xFC4qoik/OFVPVwo
         aGWpDD1EJscgRQgPr7FWzsRiAHSRAvxbjdIfmI01TcvEkijhZ7SMPuO9AkwaAcsP3bfv
         dG1/YE2WFGXSI681rh1sOqtEW0NhnkzO2djnb/cc/XB8An0vIdP947pJdIhaSNrXxX+b
         D1rGTJ4feQuNh5nUjYrvDAU2h2n8cKFu/8jMkmSgb1I1GTQoi6UtdqD1G+Jo4489Ycsc
         28lqtIg+LG/yfTbRMdruYqCejAU8vcczoCHEcixd3nhkDNla4zTN9FD7diOqqxQQ7TDI
         jMNw==
X-Forwarded-Encrypted: i=1; AKwUvBzQyS9K+emUrHdLhBPJQFtIxETzeKirvznmrEsBgHnUX9pnA+z7bpaLVEGjpep9mpNU0GuJO4d4sFwk@vger.kernel.org
X-Gm-Message-State: AFq9FYI6eVr+rtuvlCWEQ/gkrxsFUYEtllK0BtrZaFs/GymEwNXlhbpK
	wcsmlOXzPry4JFY+Oxf7PjeAdvVsIEAb+d9TTuxYAG/bvYR1dTOWdwxkw3Vwtwcfx2pHR/cap6z
	GZb5thC2FPhKn244SZEsaEuBgD71Fjpz+jWjUXmIe3jbgvw5eJAURrK6eFYYlVF1i
X-Gm-Gg: AYBFou3ytdphSbL1zaGQomT06q34ikrmZ5OiyMsOQMCBmP9HtRcEOTDKpeusMBh128Y
	02Zrrme6bsaXnkK8aSSeC8OT9E58+Y+5xPN9chT5r11fLEaG0uo5rqBi2KxvtcdU1u8L/khhvlR
	7KzPxdhJ7KfMkJRub4eWVmKB0wxkU03dgdJF5cmdifNrimcHBKkIzqfUCvAUiDoogtQtJngmHTR
	ukm7uwEC5sJoZGA3fYHq0QauaxTahEgRTCDr78bDtljk9vXw7ZK75o2esF3/+8ef1OrtCDsjbUF
	+53RzxFzY2KLbBNmTUZ3PaI00o7dTrGA9RGP1VkPZu9TBSTlo5rIjVjce8VGfWPmH6VX8DMM3IX
	5EZ3CaaGbxUsajVOOrPj3DT8yCWn2JiIQ19wEOVZNA1KIAl0AAcuG4CSyqYUOXkLELCdrncE=
X-Received: by 2002:a05:620a:55b6:b0:93c:61e0:81ff with SMTP id af79cd13be357-940ef7ad891mr1623964585a.1.1793098336454;
        Tue, 27 Oct 2026 03:52:16 -0700 (PDT)
X-Received: by 2002:a05:620a:55b6:b0:93c:61e0:81ff with SMTP id af79cd13be357-940ef7ad891mr1623961785a.1.1793098335999;
        Tue, 27 Oct 2026 03:52:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4458dd11dsm4954105a12.5.2026.10.27.03.52.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 03:52:15 -0700 (PDT)
Message-ID: <b971335b-e7ff-48a0-a1c7-9f369a3ca75c@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:52:13 +0100
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
Subject: Re: [PATCH v2 2/6] arm64: dts: qcom: sm8250-hdk: Add LT9611UXC HDMI
 bridge
To: Stone Red <redstone.dcity@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ShiTou Hong <dc_redstone@outlook.com>,
        KancyJoe <kancy2333@outlook.com>
References: <20261027080758.3990418-1-dc_redstone@outlook.com>
 <20261027080758.3990418-3-dc_redstone@outlook.com>
 <dd999250-9b3d-4176-974d-97f0cf2fc19d@oss.qualcomm.com>
 <CALkEBsyQCJwoDiR_dnqfVynEUGBi-qNenE+1oAFADPC-6OOBZQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CALkEBsyQCJwoDiR_dnqfVynEUGBi-qNenE+1oAFADPC-6OOBZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfXxlH+ul5wFont
 eXbawkIV3xHhTOGWWTBVMxiiYtiGnFU8I/+JtOAvW34gPEEGYFQBjVNJOsb2EMMLsCM1Ec9j/y1
 1n95fBr3LegxqbztFpo+pyF8hhnqjfU=
X-Proofpoint-ORIG-GUID: rV6NoQVlkoYHU5JYovU_NYpi_i0FBnq4
X-Proofpoint-GUID: rV6NoQVlkoYHU5JYovU_NYpi_i0FBnq4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfXyzBrZIGXJnlH
 IvlAnXukPdXwVn6zfxe4RfXbwQef1Y8fxQQNlqadyKaaqSUeXkP1Grpjm9zQLVAERSyfFQsh4Dl
 3tXfnOcORilLIK9Ae38y6OBelT0SfjU45EboYMbr5O8HJzmBWka/BvT9brYF0j4MWG+nTWmx77I
 6BTWG8NSNomfaGlaPFgZqlndsIoZSV7kimqnHKQWH74oV3wbvP1A/BfZq56DOlbNwVJ7BHbIfVl
 nmAR8C3OtTRk7OMd2j7O7LecSkbMbUGZFNrfKL1vf3NYOC+b9kWgE3Rr1rp11Yzpla1pVWdLUMr
 GlcoLfqRRQdzHO7p+AQD+Lcr6IlhMfYnXZf2l9sp0cmYym9IMJDx/zprbDTT72VI0xeukhZ+dGY
 QiVOYplLUBo9lwG/eBlV/s0ERvgRqevJhe+dVH1f3SemdT3G4FFtSi1ibRB8F5WA1HStDLswmm7
 ecpo70/63ZWqAcNjYeA==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae08261 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=4HeTtAMc1EHGcnT7IqoA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270043

On 10/27/26 9:56 AM, Stone Red wrote:
> Btw, there are some misplaced `status` properties in the original dts file,
> am I supposed to fix them together?

I think it's good to keep the new style for new nodes. If you wish to
do it manually (or maybe ask an LLM), updating the file itself would
be a good improvement too

Konrad
