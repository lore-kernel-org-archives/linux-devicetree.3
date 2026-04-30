Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D143B95FF
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 14:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777558311; cv=none; b=Yo2/ZmJfy+ONARn9Di9a8CEe442UtIaxVxA6iuRpWpLX166fP0HB73WrOuh1BH1eVtuGcwMce5o8F8hWcLo1AaFtqCBCyBYnUydXtyDUYp/vErRo8Py/Nh2FYhFnbkBG755NVi5xkBMVvmeDMlfJF0D+HVSFeSqQ273NzZCbhSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777558311; c=relaxed/simple;
	bh=cQcDm+jcQXGu8G7NUBXSCzwRptDfgMeJfNsJ/0RT1fE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ms0e6GgFH8RFEQNDI0U2xdhhN4qDCwyDFag0fNAByIipdI0y+goBpF/nYmg82aYaexb90CycBiyl+4Lgm4OuKxMevRt3ZBpij3+RT/T7+iz/v2RYxWGOMVQY4XGyCV2aBvolidKNOpnfttW+h6rr852LUGNXWwSQdyOVdx89dOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j2X9oZqP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hX1fFv75; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j2X9oZqP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hX1fFv75"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UANAoh1276834
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 14:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6vyYoLTi8GYiSZqan+G11SXyK2akK8tJyikgcHdifI4=; b=j2X9oZqPLz+UHBiP
	RS2Lc2vJBwhQZVagFXd41VwGaatlHgh24H8Wpn2ElgwnhXElKwMj7oUmgZANUVUB
	pLMuJ4qX9NvwAHPUK3vtTtf8Wc9fImzEgL3iuXFXpxmhb1O/Xut4psICF5citegD
	R80JbFWQey/A8lSbPHN1T7J6ccq2UtFTAwmp9hmHBg5s20Xtfqb8GrPBFCLpKVXn
	Gp1wZO/HLfEgin6BTsFKe7GqffLCnP3YoBdduZ2uD5DrgM6tV8+lLhsNchgD4VC6
	iccRY9KfXCcluQhAovGlkwdus0pm0vnQHmAzb0pcsbjvExqokMCIjI0eU0K+kdQs
	+DnKRw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv2cq1v5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 14:11:49 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-573ac60fcc2so60412e0c.0
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 07:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777558309; x=1778163109; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6vyYoLTi8GYiSZqan+G11SXyK2akK8tJyikgcHdifI4=;
        b=hX1fFv75/hClJjLlZaHr4CzbkQXuFiywkcFW8WIBRbDmz1WOpMS3FqI4sKKhTbmmct
         E4B546WFjnOkP/rbekrGSN4b0z1mcM8nFj//rG1MpUD4+4OcpvbFCLKKKhxj2CJ5GeFO
         R75Fu+tpXk4bIK+8nbit+q2HxH7T5RkLeK2aXxQLTtqasC3zKt2YMeAjpqFJ3tFM8nMH
         S1EY//usFQ5DKlgM4ZHHAac99zHzGKSrSNXRXWm1Max9gOQlsSYInE7yZDFh5zn2a2Yf
         TALT5e4YRzE/BNtLoW7NZqJax8OivIdv2fhdNVY9VwZje08PiSnpjLVbR3UhrmbfNeKx
         I8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777558309; x=1778163109;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6vyYoLTi8GYiSZqan+G11SXyK2akK8tJyikgcHdifI4=;
        b=R8/Vm5w5k1xOSm8yqqEqDud3SeJxr4nBvAbnpOtoDVEp+FqQcsBezGJGfWScKIzSSN
         cEPLYHgGp981Cn4msX1AXirQyMKtqJ2n8c+/S6xasetENdc8tE985UCJLrpZQSMll2Gx
         5/uPCwDlQ7ruHa/BbwWnTBz+3IpqbZPfgWw7JPbeLTW4h0NqVU67q9+QzuI5TnWUv6j7
         ikbuJk6VvL90Dnx/wVF3suA0rXDI0ElXV7gO98/+W8MPSF0CazwcBFeL9YOoKyzYg+Bv
         slETr/LGRS0JsfHPmd4ECTqZRYBe2FQI3riTvYrpdsMF1DjLfGxkvbgfxRg45k6D0uW0
         v56w==
X-Forwarded-Encrypted: i=1; AFNElJ+qMzy0IqkR8Rq5QKHXAb2DdID3f5r9Df9sAO3dq1Otg3KYwT/7PdQ9X2q9K6ZJCTNzWaFYlRq7bfqs@vger.kernel.org
X-Gm-Message-State: AOJu0YzEbPOT2pktQg4nsOePSXlsX5SSkzDat47qwUAx30FkVN25QbwR
	j7B7GyxaDXxTWUqc/wHybsKQyguoAG5LFVPtb589fX/6JprC8IYdYy+xtd/rYmWf6EyQ6DTmRHT
	v/YeFQ8ZGsNs8s+mqjqZCIxsw6itwVFrLluGrgEHrPvclo5vo4AnUktgK8QrBSPK8
X-Gm-Gg: AeBDiesCf9bAqyov3KoB7q5vhLSLftg3iNhnVLLMvc0ecytiIEajlg1N8UJqkjFRxQ8
	EvJnb9c25ARYAGwgtuB/RJelhTI+yUGH2iKF9BfsaRk+1v2L2mgK1TQjznjlffM2Zpj9ZZeqr9j
	lUqAT31kokMPLUGms5Y6l1rXVjf5x0vu3TWCbPiNE9fYlo1cldW6sBlSXJfi/c7kgZbBtjG0B8y
	ms6q65T4RQizdFyWVIF1k+LdyBqiBpudqqXWNb51hsaZRYhyYuhL3DCrXV4CWJuAXS8K16/2MU7
	Qxn3JDEb4O0ISvj9MLhc9zMWUNtNjajMINDAvY+MdHlWH127hXyxK2SdakyrZrkELAmgi+t+ap2
	JL87iTPXxnQtyNdYuvHz1aOv4926WYFD6NJFSWhoPcHK31WcvOXaE71ARxsxlJklnuWkpJKIz3h
	F9GzmGvxgiMaOY5A==
X-Received: by 2002:ac5:ce0d:0:b0:56a:9e65:3e30 with SMTP id 71dfb90a1353d-573c96f749amr445990e0c.3.1777558308663;
        Thu, 30 Apr 2026 07:11:48 -0700 (PDT)
X-Received: by 2002:ac5:ce0d:0:b0:56a:9e65:3e30 with SMTP id 71dfb90a1353d-573c96f749amr445941e0c.3.1777558308167;
        Thu, 30 Apr 2026 07:11:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb98543bf48sm242041966b.41.2026.04.30.07.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 07:11:47 -0700 (PDT)
Message-ID: <6e46514e-91de-4d1c-8eb0-d1688e0a3821@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 16:11:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: imola: add support for media
 carrier board
To: Riccardo Mereu <r.mereu.kernel@arduino.cc>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, broonie@kernel.org
Cc: linux@roeck-us.net, Jonathan.Cameron@huawei.com, wenswang@yeah.net,
        naresh.solanki@9elements.com, michal.simek@amd.com, nuno.sa@analog.com,
        chou.cosmo@gmail.com, grantpeltier93@gmail.com, eajames@linux.ibm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, festevam@gmail.com, imx@lists.linux.dev,
        m.facchin@arduino.cc, dmitry.baryshkov@oss.qualcomm.com,
        loic.poulain@oss.qualcomm.com, Riccardo Mereu <r.mereu@arduino.cc>
References: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
 <20260430132140.30369-4-r.mereu.kernel@arduino.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260430132140.30369-4-r.mereu.kernel@arduino.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OF1s1K4pwx-coZeIdTe90hWR6UL1A_jK
X-Authority-Analysis: v=2.4 cv=aYRRWxot c=1 sm=1 tr=0 ts=69f36325 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=fPU3a_ZXxuRe2O7PCEMA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE0NiBTYWx0ZWRfXyC4iwrSKZCmh
 u7KEhLQBqqyQUQHdI8mRDsBaaqKf9yF1HPuFub70EdDKVgqdndv0v+48veoXe1sDwVeO9tOMXf8
 JYVr3ZAvIQ+lz5Jl0DEpB0K1VL9auhmHc44huKlYsPOS0zzZ3gH4SZE5yI7oMFh0fk3gfvxwqk8
 2cOWUclFLd2ieBgFvpTSwrv+y6s11JyLxpu8P6w2J0l30t6Jv35Bz7bv1v+6vYaW4L0/CGjTrNU
 CgVed8TwVL+QPBRccq5vFfyFF71nSUYK9su/wR3V9HIRfKL3baUssoLRG/M/hlRRPwgD/LhVf8A
 0im1lByUKqU4IRr+FS5kQggbvnbxJZDxi1WdwRzasJmGqmcHi4VKnhCfyBWLDGBRjuXdaaASGli
 MZNQAqZ4gPHRFujZ4y8LdfB0+C5jmpMJdZgfkI10oT8CKpBtK7DYXuai0ahA+WiBBQRFo6LW/EZ
 0CQrzRPryLlOeBMdlnQ==
X-Proofpoint-ORIG-GUID: OF1s1K4pwx-coZeIdTe90hWR6UL1A_jK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300146

On 4/30/26 3:21 PM, Riccardo Mereu wrote:
> From: Riccardo Mereu <r.mereu@arduino.cc>
> 
> Media Carrier is an expansion board for Arduino UNO Q.
> It adds two CSI connector, one DSI connector, 3 jack connectors for
> headphones, earphone and lineout and 4 RGB LEDs.
> 
> Current devicetree overlays support:
>  - imx219 based cameras (both with 4 lanes and 2 lanes)
>  - Waveshare 5" and 8" touch A DSI displays.
> 
> As can be noticed DTBOs are split and no overlay is performed in the
> Makefile. Overlaying is handled in user-space guiding users to configure
> the system matching what it is connected to the Media Carrier.
> 
> Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   8 ++
>  ...rrier-media-camera-imx219-csi0-2lanes.dtso |  49 +++++++
>  ...rrier-media-camera-imx219-csi0-4lanes.dtso |  49 +++++++
>  ...rrier-media-camera-imx219-csi1-2lanes.dtso |  49 +++++++
>  ...rrier-media-camera-imx219-csi1-4lanes.dtso |  49 +++++++

Are the 2ln DTs actually useful in practice?
>  ...10-arduino-imola-carrier-media-common.dtsi |  46 ++++++
>  ...a-carrier-media-panel-5in_touch_a-dsi.dtso |  80 +++++++++++
>  ...a-carrier-media-panel-8in_touch_a-dsi.dtso |  80 +++++++++++

The waveshare,dsi-touch-gpio compatible is absent upstream and I
would imagine it'll take a considerable amount of time for that to
change, let's focus on the other bits for now

Konrad
