Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793094378;
	b=S0KxrENUU4u40SCn3TEg3YrukvaUNMEl5C6S8AvJATub58Cm66S+zRtnwgiVsSdOEnCz
	 lQSk7sa0skWRvRjj6iXhFSdWejQR756Qoj4DrFYWJSy+TDfMtfc8ygWyeKw+kauOEjRwh
	 1yJcF/HB39NcyqdaoZYaSJtkk8VWYiFrYOju1ODKkYKOT7X0kk1pSipJWG9qEX4G8PVgB
	 Sq81C07kLg4emhFPLLeuno+J3vBssiIj9HjVyyPKY36DvPxcOivwFGvW/QmYaR/m1MkGt
	 A+/2LOjhsQLCiK2Y2WbKZFgYEfI+93RJ/RgvQE4xuwlEaMMeHxBTVztT1+FXTAvCnTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094378;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SO9ZejKNzFByXqeubDPtQSU2TkzpvPQMbFoQT2zNea8=;
	b=ELFlMUDc/XzldT2AEMyRY7ZgLE30w61t3h40RQJTs4fNUl0+3Dl/RUwxVzFiDXIlGuTz
	 XSG8Eze9BingNrQErgRSxPb2NGGzcuzfwxOTJ4vHO/JEbDdtys79hqGhXpKv7Wb36bwhX
	 kSCetDbfVD4PxW7mmAZZ5RdIthe6o6ekYClPoeInwk/SsnhJO4FJ9lAJCntNp0lkihQOm
	 Usjb8j31CZvmvV1UGfncLBwsk4ql74ZGS36q/viNJJdI0EZU3ZI9+z4Mp1TLgZrHkKHzV
	 hJqDwAEZdO6VWet4DgWkYzxSVoNYt0KfyKwy+yZ1eJ9nsYKA8YNT4reF4W2lPkni8EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FUfhFgJa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WYML2dHr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998B3606A31F
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 09:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 998B3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FUfhFgJa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WYML2dHr
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8fwkM2259207
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 09:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SO9ZejKNzFByXqeubDPtQSU2TkzpvPQMbFoQT2zNea8=; b=FUfhFgJaeOwflecF
	mPAjGpqS0USAJTcMefy5ALM9V499+JdRLqUgkit7wkQZWff+DXndWkf2rzm+JtKH
	gQSNqxtbKK/FkT3VWddvEqNFxEy8cMs0QqMbDqmEISzUh6FuodDooTSNBKwtp2pr
	3iZMR9Xg1KbAx27Vt6jAqLgs9gPYPjTH/zOLlClohrOrCL+Qn/ncRMcD7nYbEhYS
	e0EHwniNIzN2DR5aHoxMYqV2sXebXfxVDa2TtAr/khvozT6w6uWN3a6FJELfad9K
	ftpoEVgeYCgsqX21AFJ2+negwqmySiSD5nm7i5oCVjo3UnNtXMzqNczwH/2uPwWl
	faz6TA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqw20ev1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 09:46:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac6795617aso3535650a91.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 02:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793094375; x=1793699175; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SO9ZejKNzFByXqeubDPtQSU2TkzpvPQMbFoQT2zNea8=;
        b=WYML2dHrepHQ5Fx6xlBvqLv57ixM8Q7LGw1jas6p8PSBAOE7mYYZVWvUVL/mjo5Zk/
         9j0/LfNpZLNprLZksTw7rnQdeemjCZUiQ7cZfW7e+dq/xU4L52claOctQ8Jyi6Gac3mF
         0pRFL4wPNRYGauLQBV/2/v06jfBMdrwYeLYN/PMD98JMJWqXHqAurBBfpvagu8Sg7WPr
         uFxZnGFbn2A4VqYy/GhyLG31/10xsuytxapb4Vmq3xqmn0ZcoB67CClcihnUA9HZOUo+
         c8xaucX+JL/Tlmvd6rslGA8+H14so61wGb6MTEEssEyh3QgD6iMeW8eHJCGLh3KenSEu
         NQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793094375; x=1793699175;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SO9ZejKNzFByXqeubDPtQSU2TkzpvPQMbFoQT2zNea8=;
        b=Ji3hTsij12irFa2XS2jd6RTnyuqpJY9UK4JqD++Jpbv0rz76XYBmZk2f/Gxmzo9pIs
         tLIVkReuVTunHp9ifO70GVASeQ6yz58/NkF9VRd9foSlflzqDiui6e0r69qi/4nL+vP0
         xQadXMnbRJw5sBbn74hjPRJnAuREB5ENIvSOIQ/ULZLu7PMxXAL/CgO7cw4ReMQFSXbf
         2v4ebkt1H9in2ntNhaVowLRXjK7u4nfx1gv9DovWjazhVjkt7OPLfhwQ5t4B6m4u4JDI
         Idq4kJISiHJZqArqaTKEjtIitMTkLEjWfevryoPA4UPJRriDdtfyhmbTD0feWD1B+Ydz
         JELw==
X-Forwarded-Encrypted: i=1; AKwUvBwvosFqoxxGHwaHAceq0oh34qx6yOrr0WxiPsovE7UtMLZu/9rRbdeyMQQ5BT4Cu2eWhvZ8q7Cionx5@vger.kernel.org
X-Gm-Message-State: AFq9FYL9R+QF1AUUhdBxcINaRXnv559tDVeCAfRMLPWLw8IttJvxDDzW
	bke0zYquVhZsVcOSHPM4lZuqxTZneClSSjDns9IJwlv3HZzsJ2rBn8xolGIOOa50kqVm7Gxipfr
	AbPcaJSGUYgfpKAU1CYQOCD46W/qrecIZ+ic/EVPyjddVaoa0CtAQA3IGJqypFzDc
X-Gm-Gg: AYBFou3o3dWlU2gyr6tLNz2e5T5pEE9rsM7rZ84uwPt678OKuYOQA/wRA84mENBXgtF
	NMZUvoKo+QjSM0e/bF15Zawp/MR+pwUi0qvJ1LfLXAlIRhIRAOy1I2vh0FP0C60KciahXCLZPga
	FQKOfRPUlx6fE63AY34iIGS5hnVgaVfLAI7qboupnaizYx33iXwfWz6j84Rgz640vLraKJcsq4A
	EJ6gJqhLTp0c8k0srE0lHH5pjghXJVU4orOBu+idQWe99UupCKNJMJvmQFvTMU2IK3bl1eaDM3Y
	ie4iliCCBlXPvr5/2fLDdBHbZEz9TWcZBVWEC4Hci0Rcqq9YHhz6e3X4XLavn5jzi6fN0oe4yid
	PqHYcrpja4KVz4zcrGAzRbbHx0Q==
X-Received: by 2002:a17:90b:4488:b0:3ac:7749:2f0 with SMTP id 98e67ed59e1d1-3adead4c649mr7498327a91.44.1793094375498;
        Tue, 27 Oct 2026 02:46:15 -0700 (PDT)
X-Received: by 2002:a17:90b:4488:b0:3ac:7749:2f0 with SMTP id 98e67ed59e1d1-3adead4c649mr7498293a91.44.1793094375038;
        Tue, 27 Oct 2026 02:46:15 -0700 (PDT)
Received: from [10.217.216.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb75254sm6585735a91.4.2026.10.27.02.46.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 02:46:14 -0700 (PDT)
Message-ID: <79f0f94c-e474-4343-bcd7-a50ac858097f@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 15:16:07 +0530
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
Subject: Re: [PATCH v2 1/3] clk: qcom: clk-alpha-pll: support a 28-bit
 ALPHA_VAL width
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com>
 <20260924-nords_dprx-v2-1-fa4364e087ef@oss.qualcomm.com>
 <9dc66fa5-47a9-417b-b8ff-b3a61ea75678@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <9dc66fa5-47a9-417b-b8ff-b3a61ea75678@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzOCBTYWx0ZWRfX6Nn7S6zxaxLy
 41jLD4JFc66l8lQLxdZmFwT5D1AHVltuD7v3Fygc94L/HjlMbBysvp79VjJsG1gDsXl21LAWS+E
 7Wr+nlhCG3CtH697OAyLIZHqi85gGbChkiaZmxEHV+JUtHu5EGnJex/usIF+fcLwH1BTj41VHrj
 BjsXOgYB5TV94Jx/V1V16zGVggF/bHhYmGFYyaFZ93Db1U0ikS34LBxIiNeRguwLD9yKwTzOuWB
 Cf3LuizVosb3Z68dw4qt8z4rpRdrhGYto+/y6AdF+BBvj46a0uL0HoAdMsqFJCPuggK4h7KbVYo
 kvhDlX453TqBxAUlOD3EdiUoltP5FLe5NLuewnsfdd52UKsJrzv19NPI7/7M6nLGqPl/G8IUEBN
 E8hx88MNdQIVjMeT+UWCW66T11gifQhLwJVlqUy4WVpkc/ZE2sTjAp73jF7x+sGzbfAlzf1KKrV
 zkbnXwOkpCNrBpONzdw==
X-Proofpoint-GUID: _GthWLxpGK4QV2VCLqT0iiqPXAkj95W4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzOCBTYWx0ZWRfX4hTqaALC5DJl
 ajGoRIA21wsVAtjW+tj5zpM9wN6sl1COorsr7NvIiK/hx8DdjZoZ/DB39DTi3k9/PvAOJki3UJ7
 NYYoYzCb2kxGYVvh11JBr2+0qk2X/sk=
X-Authority-Analysis: v=2.4 cv=PsYG/AM3 c=1 sm=1 tr=0 ts=6ae072e8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=UHJlGdhkk8AUXz-q67kA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: _GthWLxpGK4QV2VCLqT0iiqPXAkj95W4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270038



On 10/1/2026 8:47 PM, Konrad Dybcio wrote:
> Suggested fix:
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -2271,7 +2271,7 @@ static void zonda_pll_adjust_l_val(unsigned long rate, unsigned long prate, u32 *l)
>  	quotient = rate;
>  	remainder = do_div(quotient, prate);
>  
> -	*l = rate + (u32)(remainder * 2 >= prate);
> +	*l = quotient + (u32)(remainder * 2 >= prate);


Thanks Konrad, will push this fix.

-- 
Thanks,
Taniya Das

