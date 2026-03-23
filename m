Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B4B3822AB
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774304042; cv=none; b=NjzGqH3n0KUSLF/INXz5sc7WfTd8NJiyfD8mHrTZ8SU8RwyPFQCJuv+xSjwaANewPClqbPp2YVecH8xlAU3UQpiPdBySUtSvvZYxaRS2EK3fe+pX8LF0VNgpqIkBzdzV3zX6d/rliF9W0TtRqA0wi1tcuzRq6qjb5KUKi9FK0MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774304042; c=relaxed/simple;
	bh=lh6B8bAK/G0Rf35K12CO6wGGToV6Ja1D9X6uvV20i0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XNKdYMcdCgpUsIfcFfZAKcDA8MFiG0UaDn3hwKL1cFW8vlH+3B+WJOhlz8/ZLIa0DbEJuemI2OFzd5fEHM7jiwxC8HIHz9ONSumBKxWVt2blLhhKiLDihb3F05198cwCm0K3tmSLmBGm38dFJbzKuFPErlP00i9MtcThgDKHtuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HGRv4RPi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FHldqD9R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HGRv4RPi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FHldqD9R"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqwbZ2972577
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dq4WugyVxIXqcqDiAoenq+fof3XUEe5Rj0U0/uKDZ8s=; b=HGRv4RPiQNmsd1lE
	ukkXrXhU1yLPOlBfOJL8xB9jpFZbpyqABX60JHE6Nalz3lOkpK07Rb26J7K/pT46
	2mKix00o1u80aK0PVzZRM/BAcSxKqH/uEXl5qILbYN/n9586ybjqMnZMMUuRLq+2
	/qhuqwXcLVp54IhtEC0E+uV5Hlfvs+XU1stleWbyG876hMI3w7SpTDb/UeyekAk2
	fx8XJz51bcKai+reyFwhdQ5B44DPjQu1dRmRDxZMnTr6AmRZDdZONeOItjeFJmFs
	lnlN7GUGgZsIWfd5h1x7lY86inc2mib0IzSvm/CpEfmEn3urjW8FhBHj1OcUhAW0
	XDvj2A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc2x56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:14:00 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89c5976a8eeso38491106d6.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 15:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774304039; x=1774908839; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dq4WugyVxIXqcqDiAoenq+fof3XUEe5Rj0U0/uKDZ8s=;
        b=FHldqD9RsyicpFJvvIrJgkT/6ph9wQyrzevnbvLlSkSF07NpWRGFFcB39w70ekt+jl
         tAbVpYPjKmsrit6nWVFTqUDOThroP4PlYqIfAFdmyoXngmdgGF2sitFeb61gKN/q7nxE
         rOeZ1opzAjeLiAzFPfjvgNi+usdA6Xer4PIK8WHf6iflMviZ/qUX/6Bb7GJLe9HqLjzP
         AxA0d4EaMuI6NXf0p3cGUI10vx4Bh3dV7gi0R0JHYYRQPZJ2S1ToKCpVDLF3isvdtBtw
         V3uhuWyzh1IMx7+PIt/WbwSS28QXqOEGypYu9PGcROeYMHqfPkP2ZBt8oustCkPZoGvi
         MqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774304039; x=1774908839;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dq4WugyVxIXqcqDiAoenq+fof3XUEe5Rj0U0/uKDZ8s=;
        b=bh6irJzzuI6BmxFeK2dSXt1MjEOXVN7Qiq6DwCKjDPQJzm5HgG09OE83GXdMsv//Dn
         M3lTDaraw3fkY0X9Kd0YyPAZrZ1xWxEDH/ZjcvNJeWPTfg4LQmROo5PwRAazejlbH4Wn
         O0sZjP0QSnUKxUy3Ulwk6ExcjJ08O71nLWFoQSV7J7HgNyHh8V9LiUdU5kNpkcab3Ygn
         sRTPkm7sC5lT8xS9XpMN90Dj1Obk/ugD3EDVd35x3HkTZxaUqfm2PbFBAhIUYKiy0HkN
         8PHo+HkQQC9aGn1vwHTLEIY1pWtkTwk3NTxRrHETGMjaTifddOasrphIWlLrfc8hgIW0
         RQdA==
X-Forwarded-Encrypted: i=1; AJvYcCUCClu4uX91V3iIcznmvg4NytH2uko6PBr7GFP2z713OBc10UGaX+yR5PxFdWvaF+FOjgpc5vHeEHVX@vger.kernel.org
X-Gm-Message-State: AOJu0YxGY5eVVdowd45U9aRmp3ZF2da6pg2yfw96oNQK9rDAuFAH/Fwb
	FvPGDhqlJNdMJrfyf9mu6AkHiXRKbX8L5wOFxE2mavmYJnsgsJ5NtvfUOGMEpsGdvzTEFPbpEeD
	jPClk4lMe4miiDGOQqhhmH0IdjhtN3SCWr7HkCdQnEgbYpSurrt1cDkk1yde4bTTg
X-Gm-Gg: ATEYQzwkSRFsL7JsDxOgM5nPeKI0l/+SbNSODDON+EysyhLz4Ip/vW2MoWqLWCl6O6y
	JAxwyLjhlIw6NEvSM0sPozc/GhDGy+YLLb0PvCOUewKNyI/ijCA2wDorDCz3U5Jzi5rqY/BEfUg
	787OlvdJbtccDveiTr+mi5fs2mtC8OFi6IIbhwY6dIoz19pnGrHpQDLAPmpwxbQVD9r9MBuLSrS
	6I5SMBOH7mME2tgFy0S4W8mXjUpJMJ2chH0nWmprFJZFGBUosT38xsQWEMgwznsbyDrMBtykNWY
	vVPYhH+x6Tvg8NIUzlV6U2VjYO/iqgpSxja1PbI2DhC36ZH73DzexlkkuzhYWjTBH/tHmUZRrGW
	8lAhTwxj+dYRv1xJq9omcY+9fQ6Xsnp3NraA9ZmOvuFojHAVd
X-Received: by 2002:a05:622a:47:b0:50b:3be7:b16 with SMTP id d75a77b69052e-50b3be70c14mr198193911cf.37.1774304039471;
        Mon, 23 Mar 2026 15:13:59 -0700 (PDT)
X-Received: by 2002:a05:622a:47:b0:50b:3be7:b16 with SMTP id d75a77b69052e-50b3be70c14mr198193511cf.37.1774304039008;
        Mon, 23 Mar 2026 15:13:59 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4871105d35fsm2838765e9.19.2026.03.23.15.13.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 15:13:58 -0700 (PDT)
Message-ID: <7856055a-7c97-45ad-8571-75e51cc92567@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 22:13:57 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: glymur: Add LPASS macro codecs and
 pinctrl
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        mohammad.rafi.shaik@oss.qualcomm.com
References: <20260311124230.2241781-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260311124230.2241781-3-srinivas.kandagatla@oss.qualcomm.com>
 <c50b8a91-ebda-4ba0-984e-b4121a55adf3@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <c50b8a91-ebda-4ba0-984e-b4121a55adf3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c1bb28 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=lgBHRGTc4hejgcBBOYkA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 6I-_xT2umykySkq_K9iwhnmsACQwcq5J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2MyBTYWx0ZWRfX7dOsdbVh2QLc
 Jz7vAvCYIhkN8f1+b1yuVmubuJJRwNLeyAh6QrRIDAvWfA7y0MhJSuw3qdbO4GWjct3KDqY4L/L
 EKg3j8t6D08KMNNKwc8gxRFAjioRDXocNTeR/OC/4Ncla6Dozc6Zjv9RDzM9VQHEltx/K2tmteS
 4B1g/EMkqZePyPSFH16/HwgCBNhGKeiY8LJCzh1kIehKYSN0laOj/xnNwmCYwKxI41yAdL6kV8I
 Eb2UnS2uZEuXW3BEHvySGEL3B49mj9DdCG+2SIikJgMC75XqfD8/u01n6F8/+W9KRD9XNeWvDMk
 Kkimjf5MREIiGqxZB2sXnozFDOdov+qovr5OlfHWgW3Bjgvxxyjos5T5eOHCPX04IZglk0lQuZK
 LnHVHOSYLith0jcCLLFl3HIk+gSHYmMHKBhJSKG20N+NzNaNWys0MUcmlDG5LMvny51UWvM2xjd
 3lG72fuE0RW/FXGa4pg==
X-Proofpoint-ORIG-GUID: 6I-_xT2umykySkq_K9iwhnmsACQwcq5J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230163

On 3/18/26 10:36 AM, Konrad Dybcio wrote:
> On 3/11/26 1:42 PM, Srinivas Kandagatla wrote:
>> Add LPASS macro codecs and LPASS TLMM pin controller on Qualcomm glymur.
>> for proper sound support.
>>
>> Also add GPR(Generic Pack router) node along with
>> APM(Audio Process Manager) and PRM(Proxy resource
>> Manager) audio services.
>>
>> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		lpass_wsamacro: codec@6c90000 {
>> +			compatible = "qcom,glymur-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
>> +			reg = <0 0x06c90000 0 0x1000>;
> 
> sz = 0x10_000 (no difference but for completeness)
> 
> [...]
> 
>> +		lpass_wsa2macro: codec@6cb0000 {
>> +			compatible = "qcom,glymur-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
>> +			reg = <0 0x06cb0000 0 0x1000>;
> 
> same here
> 
> [...]
> 
>> +		lpass_tlmm: pinctrl@6e80000 {
> 
> unit address doesn't match (reg is correct)
> 
>> +			compatible = "qcom,glymur-lpass-lpi-pinctrl", "qcom,sm8650-lpass-lpi-pinctrl";
>> +			reg = <0 0x07760000 0 0x20000>;
> 
> 0 -> 0x0
> 
>> +		lpass_vamacro: codec@7660000 {
>> +			compatible = "qcom,glymur-lpass-va-macro", "qcom,sm8550-lpass-va-macro";
>> +			reg = <0 0x07660000 0 0x1000>;
> 
> _at least_ 0x2000, I don't know if the following registers are also
> related

Sure, will take a look at it and update it in next spin.

--srini
> 
> Konrad

