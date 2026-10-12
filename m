Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D7543F8C8
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 11:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791804560; cv=none; b=ID6Ehd+apyDlLOPTkhX3DQqQ/CQoQz8O8nOY0kLq/cIfZtsmlJZBAYmR7ftZniN7KxkkJPsQE/mvirmw6b/ghtyCKqgyebUlk5AOyCxwXKZxA/NUaa8+8uykE2SyNV2aoGjHlcOLJjS4e0q5lkE3lc8eCWtmoB+lR3+JkKaUOwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791804560; c=relaxed/simple;
	bh=eCCFwv675o/3cQmMuraKwllZ+8HqmVG93dv6xF/q3dQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rjO2lE8RJZ0bsMlBWs5+B76YS4I4VJdQ7si6hyyW9m3Q8lCkC1nEVKgfgIET1ffLa7YBXKI+YV0ngJYJp+OMpw2GyTHOiXh9n3nDIPNjymUJoXq7HNb3ETb5RIroQBNCwwkRnLHbjGBdhPS7glb5D1CkgoAneRZXF9v/jSIYqIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SuTUJ9xw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iq7Tonz1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SuTUJ9xw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iq7Tonz1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CA09Ih3099104
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 11:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KpsSyBRpLE7chuyU/DR9kkm+ZGDrtuFOWjf4x27diA0=; b=SuTUJ9xwGk7IcNAv
	dEJ6RWOFNIaqV2gmADy/taq4Qgx3R8BkOMLs559hEkxg0b+SqZLN2wDv+guo7q+1
	Yw3JY6kitqz0EQ6nC1+5rl5F59syw8mGqsS9IVdNh1wsOHn1o5cvHhBzGD0JGVyP
	7YEkzj03uEl2s+kazlbXbizou9rxnD98LQbjZ4TtfqgNjPzr0YCv9UAeAAWj5UKS
	7wkjuLFh9InHteW8miF08ls9RZgHP66N1tO2nOhpq4IUyXiYoDI//brvg5f1g5kh
	ZuOQckQiEykNwZp/np+yMU9ooLscIX0hnpCtlQN0CYrBmsIypS+2bQZccwCCZRbk
	+0Y+OA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wdr8fxf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 11:29:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea8a9cfe6so15640885a.2
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 04:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791804557; x=1792409357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KpsSyBRpLE7chuyU/DR9kkm+ZGDrtuFOWjf4x27diA0=;
        b=Iq7Tonz1++3akKazTR5396DnZpfrLWewjS83Kl2zChMlB5efq8O68x8Dgdzjgxo9Hv
         FJrFB+0SLqSh9TZFbWEhJY6lCzDqYcAL9MbYenGsN6cGHd0OAB4Q396mBR87j8kAFM6I
         VcdPT4xIcd11fLB/uQjjc2WbCWTUTvTxrR2n582P2qmDhnQT9/cMM+kVgES3ThdqLN7t
         7FBJbXwu4QkMrYLkImH1LFFmra7gv/iwCVuiJyiXhfHyXYOip7Riou8/HYqUGEeEj3L5
         DThhnoe6rIg4BAWWYb9DYsErZXr+owWGbvVayM/9GjcVtOjsgwmfcR49Od5b5BzY70fV
         QSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791804557; x=1792409357;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KpsSyBRpLE7chuyU/DR9kkm+ZGDrtuFOWjf4x27diA0=;
        b=rDvYG9AAhm30NXmos4Ds3YNqMIiOAzdLPaSmGyIFPrXvWsNhdSeSXvIVe+DDsl20Xk
         ksoLjzyLI3pUC55bbA5h1wZiIFNUb5WfDMUCo59qISRt23VlY+qBr6xSB17vKftghEyT
         5v01/wjWbFTHitWK1IxFleJD2bTrvIZDjJc+0qSbGPGWV58WAHxHw3PIH41pcy5EmQPW
         veSS5cFUDL7TsXx+xXK3qwu5uKT5C7U3VbMK8uxysFjZmuhASApWXNq18YaqbeUoYgAj
         pUs5jTBfVQTBpEm2mrf8ZaJHZaN5CoNfcGXI/wFbC4GbESr+iXOVoTsQubbpuX/U1klL
         OwRA==
X-Forwarded-Encrypted: i=1; AKwUvByw8vXTWYgd6Ru0RDaiVF9x6zZNxXsD9G+nPCEgDpFj95soLl7/RpDliv9dLet4H4zcDJPF/wYoCFHE@vger.kernel.org
X-Gm-Message-State: AFq9FYI5EAZdluEecUjJW4iMQ+2ZlcEae3g4Kby2OSr1okmlpI9gQYjN
	elddN7IZuwtj2letmqdLlnMzJRQc4GM8oHj6pdx56pg5Jm4pZal1E24hKTnBbYxWLjHkXLbsv2V
	dtdJi1xrm/1HDAFs/WuvCIUjRClpFjYfStwYWMYuTSS6af0Obe8Qdu7KLqrzyjydy
X-Gm-Gg: AYBFou0IF9L9aLm5sjxBttaR8m/QUr2AbEEjMKq9yd1gwWhdDtUV1re1QoUxiv7Fb5C
	nLdjC6rb2LMPio4FkNHKECz35Yav3nsFtXS+x7oO/uRaqZTINt7e0WmW8GTM65zrzCbig0YrfKe
	MnDbWbPNHyRIPziXgi1ys5L0mJgg5A3tylHNmbC4l0Jf3jsV2I7fsG0D5HGs9Rud4vJ38KQJqLA
	k4PpkOPw4B1oe7lNpixjuq/mYugURq4DZmwrKwpIuITWTknKNIUJ44daVmGEqYuiPjF0/Vlv6t1
	t7HEWGlldThV/mKuA9WCnlhBp/mtYzcF80aXeBxQGTtnokt6N1ndMiDhUXRYOBZ0jx316MXVqvz
	iqi6DtV9LmyHYFEjit341IA==
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr1713164685a.3.1791804557032;
        Mon, 12 Oct 2026 04:29:17 -0700 (PDT)
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr1713160085a.3.1791804556519;
        Mon, 12 Oct 2026 04:29:16 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179e01101sm4750943a12.35.2026.10.12.04.29.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 04:29:15 -0700 (PDT)
Message-ID: <b7bc5c82-6812-4df6-9820-122a4c957036@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 13:29:13 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/12] hwmon: Add Qualcomm PMIC BCL driver
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-2-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-2-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0NSBTYWx0ZWRfXxD+krdhbxmHF
 CwrZuMg/ypryHuJyOH34MCChunCMKnsPFjohESg1IWEWwb368RO9KnLHlMuAfsd9buS180dhJ0R
 7YpdB6TkVto30kqRWk+yJoN/ZdwucRdCXsuMYUkdmpGC9IomRJN5qNzMQxsjYEmCjdKxooWQypZ
 7YUWCX3BPW5bInJ9CxOaJXQ1y9HXM2U3eQkqc1708wG+t6VfaFza96pwq7L2xcnQmpsTyjb+/SH
 HXLGUUbS6ufW4Bkz1nssD5WPLvrATBrFhDB/sDmXk86Vi/bQwYBLRNYPmuAm1QmdHJ71yRS8SF1
 eAfYCvjIMqVDeHIWg0ry1F6e73dFguxDMKUIh6aoMeACh3Z370pkENCWmNkRo4FeVrBd3f6F4dj
 L5RfHUUBrmBjYUdufhavRezuWZa7h3ZcwnmsXR6X+4QhhYDJ51DCiRwTlcBHjQA7mNQVpr9Ex5t
 8wesWtw7jHu3G5lP/RQ==
X-Authority-Analysis: v=2.4 cv=SvAFe/O0 c=1 sm=1 tr=0 ts=6accc48e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=OrLOohl1hFq0FUu3FHgA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0NSBTYWx0ZWRfX/dz7SSdc4bMq
 bxvzNPj1HeREm/O8NihA1+cWCvLlJ77E3PyBNmOGvYaLxBRvZMf42ezJPlUE3eOkPKvpYjTFL1y
 DvI2464EqdpSrrHRYLy3Tr5rtR56QUM=
X-Proofpoint-ORIG-GUID: P2sG1ubLMP3Ce5U8hgyMbBxrqot1ljhm
X-Proofpoint-GUID: P2sG1ubLMP3Ce5U8hgyMbBxrqot1ljhm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120045

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add driver for Qualcomm SPMI PMIC Battery Current Limiting (BCL)
> hardware monitor. The driver exposes battery voltage and current
> monitoring through hwmon interface.

[...]

> +static int bcl_in_thresh_write(struct bcl_device *bcl, long value, enum bcl_limit_alarm lvl)
> +{

[...]

> +static int bcl_curr_thresh_write(struct bcl_device *bcl, long value, enum bcl_limit_alarm lvl)

these two and bcl_in/curr_thresh_read can be unified, then some
helpers can be collapsed inline as they become single-use

[...]

> +static unsigned int bcl_get_version_major(const struct bcl_device *bcl)
> +{
> +	u32 raw_val = 0;
> +
> +	regmap_field_read(bcl->fields[F_V_MAJOR], &raw_val);
> +
> +	return raw_val;
> +}

This is single-use and trivial, inline it into the call site

> +
> +static unsigned int bcl_get_version_minor(const struct bcl_device *bcl)
> +{
> +	u32 raw_val = 0;
> +
> +	regmap_field_read(bcl->fields[F_V_MINOR], &raw_val);
> +
> +	return raw_val;
> +}

Likewise

[...]

> +static int bcl_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
> +			   u32 attr, int channel, long val)

Do we expect userland to program these, or are the default limits
sensible?

[...]

> +	/*
> +	 * Map register value to battery configuration.
> +	 * As per hardware documentation:
> +	 * 0 -> 2S, 1 -> 3S, 2 -> 4S (unsupported)

Would it be hard to support?

[...]

> +	/* Check if battery detection is supported */
> +	if (desc->battery_config_field.reg == 0) {

This is slightly sketchy, but SPMI peripherals always have some ID
registers at address zero, so okay..

[...]

> +static const struct of_device_id bcl_match[] = {
> +	{
> +		.compatible = "qcom,pm7250b-bcl",
> +		.data = &pm7250b_data,
> +	}, {
> +		.compatible = "qcom,pm7550-bcl",
> +		.data = &pm8550_data,

Are they exactly identical? If so, please use a fallback compatible

Konrad
