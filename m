Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D991DC1AB
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 06:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782021674; cv=none; b=e1kYjt05Oq/Ni6L3FLkskx8ldPWRkB/ccLu6G9Ejp0hp3vnbTR3UXqIWsfAiFZ6qz3FBtlXiFzGi27z4J8ZUkolp8b7fdr3TqDQ9dQTpXlPYefZ7+sK5HcvlRxDTWD5MEPeypd7BekLxEkIOwCbxCc7fWXzR5kz2J87uLvu+K4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782021674; c=relaxed/simple;
	bh=Ps4FYVhY/+AWPZL6Cgx+yY0Oak9eRrn0s+QgtMMDndc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I6LqqCFn+YDA4o9zcI9FdqD+hH/5DOhnUBFcfDAfwZ3JYHgZ1+AmX3jUqGtNM9WVh5TbhU48c2uuITPuCwrYWu7FJInLjS7T8Uww1Dy/tRiJBuS4GALAe+rYXjGMPH+4b8yMfbubuXne8MUWguU7psoyxrvcG7bm0QEqWMwj34U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bWAavCub; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QnWSIK1I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bWAavCub";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QnWSIK1I"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65L5jYdE1305249
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 06:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WfmmR4KR+FxAid9sd3QGFwzw4X7Tu5ccd/ACfHBvlSo=; b=bWAavCubaAeSbQ2B
	5X7Tk45bwritVIUZ6q7ChKGUS5amfhJX7i6Jd3+U8KstjQVYB//B890waTbupy9b
	tJGRNDICPR1Jmflh+TmMNV29BxRzu7Cc+SFEay0RQthRnVPYESrrpI7WkU5VD143
	wexfNLzPJ1ZnOnb5OMuuIkR5VKYO2anf62kK7rZAWbyQvF5FH3QEr+Vm42Q+MPG1
	8okJYHbaGa4baOhiXL9wGya+HQK2q/qefMZ1x09nSEovfWnr1czKkIP5oN2215pS
	vJF2COzVkgD5GEGRKuUE12Bl+jL8bxINXTToZzgEPUkQFTGeZEl5+zA5C8N8CehX
	pcEM4A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewk882avh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 06:01:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c860544c077so4752984a12.3
        for <devicetree@vger.kernel.org>; Sat, 20 Jun 2026 23:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782021671; x=1782626471; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WfmmR4KR+FxAid9sd3QGFwzw4X7Tu5ccd/ACfHBvlSo=;
        b=QnWSIK1Ieh3z6sMm15nAIjkEnBshbx7p3MFclrQpGrch6/A1v45DcOqnPJYh3sa/mD
         gfvhs7XSbC5Fg53rItnmHSXgIqSUq9N0juHBMeHniREacli6aD3OXePsJ/R74HMt6IR+
         U0Vt0asPCIHumqvdCrJhlAFoDZs7ZofVgngjybOkhIvW3VUGmZnTrUQSxcfUKIbNR8oe
         SOJF7ebOte/cZgGugnXPWZ8VohmqyRDEMzGLfRpb2enS8EG7C/68HpZwyWfeqIyOc+yN
         VMQCqcwaQn4hj/DDRDP/zODrRQwDOA43J5xd076Uo9Fb+tMGIhPysTbAfdiYiI1HT+Xx
         6Uog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782021671; x=1782626471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WfmmR4KR+FxAid9sd3QGFwzw4X7Tu5ccd/ACfHBvlSo=;
        b=FthP5miqwp5kBikH42ZZLfy3I37kn6f+jl5q1uaIbfhV+EAohhjK1W9NBT2hypujuu
         88YeRQTgtTF6AOE7htknP5QJK499Et8HP0W3DZFGwYK9P6IEqCIYtTLwO+s+0mUNFRMV
         X/UjYIRWZgByedidZH/lIOvZ0cnwP2cj4jCJU2tXEhmJzTYKBD1nFvijbMnFMazpAlNw
         j6YbRTn4wFeGS48X+G0YkRwa/u/8SLKvupRTTIbzlNy5fH8MP4JWB2AbT0FOD6DQ0/mV
         3pzwR0mLa/nU/5mv8zBGt2huVqZVJnM4wIMtckoVnmlmC2TS8stGeFHZWKsGJysn8CY+
         EdzQ==
X-Forwarded-Encrypted: i=1; AFNElJ9E7vzc3KZWFO/cy1KOlgaRbrqxkur7hwrsdDoYFn8INsh8JmKFqMXywiFTbKx1/M62w8olEYaVp09a@vger.kernel.org
X-Gm-Message-State: AOJu0YxKcwg61hR+yr2Q4yPOlJvIBQ2CaREGQPqXZmHjo53kIGT42/KV
	74Sfe9I+fTWugs3jyZpG3HDGHYC6LxFizhFP7jHCL3Gzltf7VsKsSQ4NEAUkN2I2K5HJtzBBb/j
	Hqfu3l4ajnCRdHvdnclEbCZCiQKqvfnD+JT9XNPe7vUB6hSd3NUh/hDDzn5vF3Ibm3+k5bqFt
X-Gm-Gg: AfdE7cmIf+l0PEwwDJNC9BkKSoe6kHRxxU2UZG3OXe0QtbIzTVAbZbSIy3q/16/VDZD
	Raq6gLIWbnxoYWYatEXx/H4HpF7phtAo4J5U4RsePXwZBNMgvxuqa4e4jJaY/CqqC+ZQ38Ap0YO
	r7XRtKfo6wayhzc/fk2GBnzkrIFzLVbyLAIlNiGLr52fpFdC9+8kvzs7a3ou7PGD9TOSRLbrkjy
	neYXwDAe15PdXXNl38VCFBLLiVQY6RY7DHkS+2sj0A6ihmBHpMh+IDHJ7zmKeBL4HlwUb8mEwr3
	1lGC65DSfpxPn1HArkTPo9AAVwZPNlsjM/n9jhREVUQsA8tW6B8mmOPy3IA03IiZ2cgZ+JztvB5
	K0Mne4QRlFjPYtqVDTxQUnqM3qdfie4q8akc3igkJ1w==
X-Received: by 2002:a05:6a00:4385:b0:823:d2c:b156 with SMTP id d2e1a72fcca58-8455078c20dmr11621221b3a.5.1782021671032;
        Sat, 20 Jun 2026 23:01:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:4385:b0:823:d2c:b156 with SMTP id d2e1a72fcca58-8455078c20dmr11621188b3a.5.1782021670637;
        Sat, 20 Jun 2026 23:01:10 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.226.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ecd779sm3823101b3a.53.2026.06.20.23.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Jun 2026 23:01:10 -0700 (PDT)
Message-ID: <cfe1778b-c204-46cd-a9c8-2bcda8ea63ac@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 11:30:59 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] arm64: dts: qcom: shikra: Add pin configuration
 for mclks
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
 <20260615-shikra-camss-review-v4-4-bcb51081735b@oss.qualcomm.com>
 <6e760884-87b1-4ec8-9ae1-e53901451b65@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <6e760884-87b1-4ec8-9ae1-e53901451b65@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIxMDA1NyBTYWx0ZWRfX+ZRjNOxC3wiB
 afqRrJEPsYlBWvrVDnLuVtcPhBNC/vn6WlA7Q7YH2yELg3ZByXkWLs0PhZdc3sIUVj30P0f53CH
 gZRIqXgJHq7g8wX5/bBczp1xLB462M356WyUg9ex74/uHTGTG9y2tNDjMdhwx1pE2jSU/Ecy1lF
 39d5uol8HfbfkIUCOmyczHnot87sxatU6nomfsMea0Ah+0Ud5f3Y34J/ee8d4M7FZujnY5dpVD3
 xgzlN6btC4W+AWHv4EYYxyU231n6BYLkaO5SsB/qZknVIxsK9T/YgVxN5cI7EpBxpAij1jYuJBU
 wEoRZxVkF88Sx/qKu+hRJwXgaK9QTI9YMYO2qh83taJK9I+DcJYx44efcJOBFR3439rX8Hwl0/l
 a8wKMGB9Drd/1VhKCeJgGnZe+NXgbzLiA5Vojv4G0c9pDXRDMy78uOLvdX7WjnO67zJst4zmHsU
 biVienCOTaKh/MFLDYg==
X-Authority-Analysis: v=2.4 cv=b9qCJNGx c=1 sm=1 tr=0 ts=6a377e28 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Kt9MDo777XuedpO0AoDL9g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=EEnOiY-A6ZLknHPuIi8A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: lEVGbz6T0fVCZ0XcjnlHGIxz9yCePnxN
X-Proofpoint-ORIG-GUID: lEVGbz6T0fVCZ0XcjnlHGIxz9yCePnxN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIxMDA1NyBTYWx0ZWRfXyPoXU6MpqKxD
 TyXPwWajl0eGJiP664BNPqx2zfTITLwSEDWu8GtkjCm+DXvV+pyMHRhidgDZ3VSeFniUTVT8EZ7
 sk6IIKZQ4mzQV4wOM8EwqJOP4DYB3b0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-20_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606210057



On 19-06-2026 21:06, Konrad Dybcio wrote:
>> +			cam_mclk3_default: cam-mclk3-default-state {
>> +				pins = "gpio98";
>> +				function = "cam_mclk";
>> +				drive-strength = <2>;
>> +				bias-disable;
>> +			};
> Please try to keep the entries roughly sorted by the pin index
> 
> For the entries themselves:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
ACK, will fix pin ordering in v5 - qup_uart0 (gpio0/1/...) first,
then cci_i2c(gpio36/37/41/42), then mclk0-3(gpio34/35/96/98).

Could you please review the other DTS patches too?

--
Regards,
Nihal Kumar Gupta
