Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8427C3EAC84
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562153; cv=none; b=auWwWmmtjJ8wdYL+h7JHCsja9VG8l9Sy6+HI5kBGLY2sWDgQYu1FXjNylQKiMpd1ZyCHOuD+T3UzcEhEgff9QGX0cJVEq9EDSw93D00BkB1iX2yeCHe47OlC/01eGS1ZqvCiYQJIf4DJ0qlG8juh8Zmyt2T91IKHNq/ZsiCjGbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562153; c=relaxed/simple;
	bh=zkcfOpvOOEGZmwcMkmOXgL76Nm/r+udiGKSvmwxFSf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cP0XGnqJ9s28VkVglu1TkEbJPtbQUT+4M6IUXgN6bl/7uGbEYsA+BfOSPkDtX4vJMuz9Yt9kTMBQ2yJQeEe4gvN6zXMSOWk32wvqmF6mEDC5g7B/Q5hctl/ZkzCMIkH4klUlA482ew9rP/w904XMpNTAN4GwhY4CR+R8UcuUkEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dqwoLX+C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QselUN1J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dqwoLX+C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QselUN1J"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O7PxKk2666299
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cyEWFx7y5fZb6o89gZ5oNS7PdefHCupUplXdHeftKFg=; b=dqwoLX+C7QT6RQov
	mKpBteKiQe0EkzvFVHoeQnevASa/EmEvyRoOBRNqOj3Fv2jDEh1uJAo9EQ1T4ZsP
	L3amMgPRsnizTaEFhQZDavC2EB1aSxYZuxRdJd97Z0skdLY72Kye0K/IhnCTYTrb
	WpZj805O1jsJ95/fMGcqlMcjCPywIxBEceHEltTKCPIOas286kUrq8KodtQpYw73
	ztOw87E3qI/6zlfmvYfyJ2L+7U6j0oeq2B8INivmM3nyE169hw5i1nO1QeZTvB8U
	24+8bCADETR070qYkyG1047KL/Vx9rjdATRkMauWbMLU2ZZTfmqv2NTFWnJHh4u4
	EI5rpw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgrcap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:02:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52b4e315000so13975251cf.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 02:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787562150; x=1788166950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cyEWFx7y5fZb6o89gZ5oNS7PdefHCupUplXdHeftKFg=;
        b=QselUN1JbrVBVEN/ZmcHeStbU/uQWWQD6vQN2P8aVjqRchCcWlLQQ41FmFF/e1UsrM
         hmMlLynznt/CeW1ImU2B+3Py4raH2d9JuqeF/S7jDJV5+EqvBEravrj/bnM5ni/YBjsI
         jHlY3DjKFM2d3wpeP1Fm8UCdAbK3C89r7BRmpiMYitkUtajOebfPSlkb3068BoS/wJhX
         bNh+jx6XxIybNikWQtkd7yxvRsRfG43eTpAwBraScmbTmOLh1eZcMzKPv761njd12fwG
         BrM1FoDIKC5BXCYjYbgfwQfONlsSYJ3DD5bfpmwslixafGBCclb+p3WEr3XWGOTlrs9l
         p9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787562150; x=1788166950;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cyEWFx7y5fZb6o89gZ5oNS7PdefHCupUplXdHeftKFg=;
        b=JdM/MXhZ74EoQNSgWTs/NehnYDg0hpVgxUQvI6KoHl1inCxZJ7V0sgQkp/2Kvon9lk
         WL6sx9768jM0I88P/agbXdyh4GKWQsC90as5JbYnC9Ex/hjNkouSLsSoH6tOZeVMtfvf
         +yyFbo0QM6eE2d5hJCX+SW8ZiCWGgLNq9eSosItlpX0oRAMbT0MJMt8d3zdOLhpN4pou
         Dsfbfz80rnq3S+U18/iQMBZvkrrPe2ojd54+W6XVcYpqhnQPJsZT7csoaseHqIlR+4w9
         fzFIeBK6+XDCc77vYUaXL2o9RM+hYkbgqNYxlCarLyJBscrA0Q3aea5CcTkXAO+q5fAw
         TUBQ==
X-Forwarded-Encrypted: i=1; AHgh+RpOoYAvbQPO3e0vvKE7gjGGHyII+kzHb/sWxiEaoip5mT/UqCG4KfNI06VQTq9amU4hMFcixGB0DGbs@vger.kernel.org
X-Gm-Message-State: AFuF++ku1Yqzplo7yzo0j3ZKvxUY2o0WF3UsAfCJkbEf3Tw1eLJ2rt5O
	n/t/1GgQ/l5OWMb3wIdAC1tv48v+3Ru8JJaysQN65H3VkiyeJDTVuPTPbo5+AUcnFsvxQ2aB7jC
	7LX5U8Nx2q20Ac0cwrLT7ZzLUi33Qp0o1i5GEPTkfFEHBRpU4C4z64Hr6ZZ+5n/w1
X-Gm-Gg: AR+sD11nrtiL3lRYZqJQSx4pRpX4mnuwlpTriDnuaohKakYF3RXiV61VNHmqVFpzKyZ
	hvdayI9a9cZlLlA1EK9TzhPmK/iwJ3AtlE2S6kyqvm2NgFfxbiDK0PZJOZllHU5L/pwd7A33sGL
	39uSNZHK1XvkcqC0Y6xQD20QBpRRPJ2l2DpUBSonwOtG983Z481lyPfdziBBtZ/F684LkTrWTrj
	rnQHuisDKcRNRXqHWeMYTxBfsNNyS1MxRUtWNd+zJiOWl3+fkoBhciI3mVMjDqKI3YcXUFM0EU3
	p7zVgBpDglJovBNZ/JFWuTMIDh7gN5psrEfT+hYQdWftmb/XOokTo1WanQ0seUmtk3TNA1ASEaK
	y0yfSTRQ2pxbQrBnAwKPw5zsi
X-Received: by 2002:a05:6214:4687:b0:8f1:507a:ed6c with SMTP id 6a1803df08f44-90c811d6d75mr176597696d6.5.1787562149820;
        Mon, 24 Aug 2026 02:02:29 -0700 (PDT)
X-Received: by 2002:a05:6214:4687:b0:8f1:507a:ed6c with SMTP id 6a1803df08f44-90c811d6d75mr176597326d6.5.1787562149363;
        Mon, 24 Aug 2026 02:02:29 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249672becesm1191775466b.42.2026.08.24.02.02.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:02:28 -0700 (PDT)
Message-ID: <2e9f6fe9-31ab-4107-a623-b15470fe68de@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:02:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/14] arm64: dts: qcom: ipq5332: Add clocks required
 for USB3 support
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <quic_ipkumar@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-8-8f355d7ff0ef@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812-ipq5018-usb3-v2-8-8f355d7ff0ef@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfX/3tDPnnIVAeK
 HDCaHtPZNcOteV+7FCbyV8UifZhYolMd/e17grNYe2sEJKiI/rpdH9eEsFI305C8hD8UroEf3vh
 LPzziS6gG1K/EdKlTGZmfWjeqReMxmM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfXwObC0Sz+R8tV
 +FGJNISWk2Mwm6NaO62pb0Jma0eVpKMzmbkLKytOSB/5PIzKcsCYaB27VHZbjq+LKcviGtUwR7x
 g+Dmn7SYG3DCJNlzIzw2I+QA3wnNvlFrvD6ijqKkZbtPA2hvbGEoSoS9P6D3RLjwbO+wH0m+Mi9
 8sCY4S2QVl5Q/Yi3SlxJlJ7mRRCmAox0l6rYNH0/M1vgGWC2m7Umjbeqxcpu6hV5552sJLEFD5p
 Prwc5lDIX2ENfC3b+ftb8w/McMdSBNvV2SISoVJe6ZPpnZ7qF/qa9dqHT6QpTcT1v2836GxBbdc
 32qwrg01ZzxInj8L+RGdGfOqg+0Cwkh+bw/nAiMxCfW+5sF3pvV9opCyoAqk2kTGE5ePstsq/Mq
 5qOdRBIKZ7FZJDJTJ991nSoRt6+ABLo1R6+/7GPjbS+ranR27pLMHLFsP2UIwaoElDP/mpvkAWL
 /EB9AmAMJOsO4kVt16Q==
X-Proofpoint-ORIG-GUID: a2osuiOeOYs4q4muiICKv4vxdq8NZwOG
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8c08a6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=UqCG9HQmAAAA:8 a=TbTMhDWFNTfgXYAo_YsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: a2osuiOeOYs4q4muiICKv4vxdq8NZwOG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240079

On 8/12/26 11:34 AM, George Moussalem via B4 Relay wrote:
> From: Praveenkumar I <quic_ipkumar@quicinc.com>
> 
> Add aux and lfps clocks to USB controller node for Super-Speed support.
> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Is the GCC_USB0_PIPE_CLK not necessary too?

Konrad
