Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586671;
	b=mqiXgcxn5tJa6giIMUjtjheBeu8/5IT6Fcx9GHrC6BZcomXgQBjXg0ymmWppymfEtCm+
	 x/69Qj4TCi98gve+82Y5ZrbcVN2ipmPS1KVdDMbYVkoeJm4ka0cOX6v79YF0T4l+v93r5
	 8FAvm2YGyo4UYeCqnI5VN3pcOK4E2gXmic6LW99uOxJuHnYVtzB68N077ZjOXw9F0tiwY
	 /m+oN+RCgXgfAeWsQPPb/Q0CjNUdyWj1ZLGRfR3rtOLyqNfQa+VAn39SPmmZecYtM1jJi
	 KQdlrZMv1cm6r6SuR4Z8VmuJltip1EAkPlm23xhXflObBxNcZgITKMEqTP/CwmuqgUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586671;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9v6oR379dNMSxnj6f20WyQOZxHY2i1bJNgj0/16ZZec=;
	b=x43ZGm6peiWEcEGnLEslAB/QDKUqGrO0naqhoZnHIPZJ5Xb8MwgrYurrUk8oORQnbv7y
	 Tda+jYFLDEVW4oF93tuQJfJ1miT3LImOhe2PT3D8caYd+f1+VJJu7Hxrq25/EehtYZNX5
	 vETr+kWGIPI1oiLFaepaZQLgpHWAvajIlCWrRx5lSQzcojy+ySujqLkxlypjlZU4TMESm
	 93PL8B8b/RGOyFrrRIyJ2OjYVgqflNm+5qV4dVLfBhqrl+nohu/7Mqvyz2ZSlT9drwkcu
	 4tM8jNMdiZ/w5/0y7aAfuhtHSTTnCV6sHsfvu4AnS/XGnlHdN6lHGYx7Yzt63c21ZwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HvFTPjd+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WoRvt6om;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675E1606A31B
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 12:44:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 675E1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HvFTPjd+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WoRvt6om
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgEpK3225592
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 12:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9v6oR379dNMSxnj6f20WyQOZxHY2i1bJNgj0/16ZZec=; b=HvFTPjd+5tzhkrlG
	7tXsJCR2/O3mAWZ7h2hp6jn+zv0W6eCR3Vu16YG5UzuVCo/JRDpLLRIKQh0YaEMf
	XnsRkcglg9E3595WkeW3fm4sqG58CHHn3Ocq86Th+SalS0XWHTov8xxxYqDupQBO
	Z37QIg840FeaH1GbhlKM67zscIkfuc+8q0gOxCha91031OHGXcpcdCD1su6oiPn2
	80Bi7guepb7MDwMxrqU78fLUhDsbqn6w3kXrYF2OhFApvfmPtKSiV2KFIiCobVWo
	RwOxobMGx1bXOHN7v3TuB3USZGqgKfUCF3oMRNgD8hTbcbggp2zGoeTVlc4FEMTR
	BzV7TQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy791rs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 12:44:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1f1f2ecfso19431485a.3
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 05:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792586670; x=1793191470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9v6oR379dNMSxnj6f20WyQOZxHY2i1bJNgj0/16ZZec=;
        b=WoRvt6omIiQqA38QNDkE9sWDfmIk+L8/YRYbylevcOsfS6MQhZVTCBv9URWtIIKV1R
         OlvjAAaTVRJs0WNUx3r4TxgV5DPg8dKRrtGQyWmz/QC5EPMd6CEN9igT4m/4G1SYjYXE
         aiTm6J8lVfpHK2xcCQ0CyO0kLM/lYfU19Hkd3C2RBfHd1gmzU5Q2PTdClWoLf04GWvaM
         Fp8gzCqu9yY0suEJXX5mM+l7CvmGoM9ohRLD0jSYyH6CAGiIxdFuC18Q/0PvfhqQtHS8
         USndWLbW5WkhIJFjvV7RQh3rAQiBWSLWggwjUCPoepVzg2cS/TZnVoQLGRq08ce74Uce
         7gYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586670; x=1793191470;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9v6oR379dNMSxnj6f20WyQOZxHY2i1bJNgj0/16ZZec=;
        b=hqxyKCHLoP2RJSkHOZtcmtIOU3blL4IBJOKJdjFkJPcT/TywpGqVAAaMDY4gS034dg
         eFHSC5ply5WlJnQTh/jz2aCa8p1xhkYjTjzx6Od89vRRBW1Hu9deEg0XXZs56jkmhYx0
         qJTkNf4wsnScOQs7BZQoZ4+XVX8wbQjEmIlCXH/5yNVBqKnsQdIkz4WfT081FhRshRgn
         AoFdS56mDodydMeINIDWWBE9vlSPE5DxBlLQ4J87atSOjKL26x7tNpnrHFaddPJFSaNC
         XIaNnhwA1evdyi4LGcI9E4KChoVleZkeVasbAVlxNl9O2IxpmtDOLzc0goItFDztzJ0c
         emuw==
X-Forwarded-Encrypted: i=1; AKwUvBxsIxgWWGFwys6y4dUY3wacLZRnWuI7iyQkDdYDWlpf78ONPzTUvkwEQUgOjcJvnOw420WZ2vf39hUW@vger.kernel.org
X-Gm-Message-State: AFq9FYJLeE/3YoFFaoOmP5xqadH40DLRMisymp7IkGqZDKr0obw+ufre
	taHXE/ptZgA+f8insZk08TpZf7tnVsI1Qb2QA97MGKxFyaACseNabNkY14BEZUDlO2NNftAUjD2
	Ur5BcExNzFHjl9eGEG7CEGAOVFjGH6zyhFtkD33wfTktf5y5sPIN3dzy9m3U8BmZvWvrUzPa+M7
	HM5w==
X-Gm-Gg: AYBFou1EehjyylStJXLeoDwmB5F6gokCcAMY31bUjMLfI8+bBXA6tLSC7Op896Aa9y+
	B1FK0eJkkI1qOwC+yhg8lkYjs59/ldyUro63Icu8ue4nKaaCyQwP2w1j9KkRpm8G+6/XLokmEew
	Infv/HFYLCt50W8uHn39Tg0rwr0OvH9zIQQ7JZ1gi/lIQu8738JseVhuwtseRTQbYoSC7gcb4Xu
	82jdHEvMF2nZMU+FvVVSfYTuBaW/QyXkpupwLM5f294s4oByPt0ho/8xD2qoqWdEnm5No/OQ64e
	uwXSkp2O114Gca94zJlkvAexnsh0e0NPy25jeb/6o8OlTRI3r7OKkFtd3t8LIUDCMpGrPQxMWdV
	LC9lS8/QwgxmZrKwATPph0w==
X-Received: by 2002:a05:620a:2b91:b0:93e:e111:2771 with SMTP id af79cd13be357-93f57e9331fmr466828485a.2.1792586669492;
        Wed, 21 Oct 2026 05:44:29 -0700 (PDT)
X-Received: by 2002:a05:620a:2b91:b0:93e:e111:2771 with SMTP id af79cd13be357-93f57e9331fmr466824785a.2.1792586668992;
        Wed, 21 Oct 2026 05:44:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f78660sm72328066b.17.2026.10.21.05.44.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 05:44:27 -0700 (PDT)
Message-ID: <bd062ae7-74c2-486e-9413-15ca8c943055@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:44:25 +0200
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
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: ipq5018: add Ubiquiti UniFi U6
 Enterprise
To: Andrei-Alexandru Bleortu <me@andrei-z.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg
 <johannes@sipsolutions.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
References: <cover.1791110510.git.me@andrei-z.com>
 <ddbc631bb95ae5fcc6498e083b280ba2b736181f.1791110510.git.me@andrei-z.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ddbc631bb95ae5fcc6498e083b280ba2b736181f.1791110510.git.me@andrei-z.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Su8FRhoqukeZilRQQhmP7R4AbQuP8to1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1MCBTYWx0ZWRfX5/PSlkbtrztY
 GlAQQNBcARlPiAumuImm0ZFLSZmak8jv+RrN42uOlQLOeFdVsldBx6ZKcShN6LZqn6u3BaopUGh
 rdYwRQE8/TlEAptevEGpMlwQvkcTnFr1upMXPmnHPu1PtESX1wxVyqxV7RhVlEhaWgf8GYCK/J1
 uPy1tzEi0BJCKCT04n82Vsb02tXpqOJPi61Cl3XVCVo1Whj32oZ2BGlhglEr4b/ZlcgM1yTbtcX
 vuCH1Gfme6FE1RTFvYtB7Cd/oEoQOh5ardVTUHr++fsHeMsVqtepsmVrOyKkoF79qlLi//Ryuta
 4qG56lVaH/MQeE9WwKwlpKhNELEf3MgVi890+QAthI9p43Do8YemERwuey2UJ949a+sjvmQDsNp
 46tzr0QSPA/UGYtG/OlI8a9VY+QiIJn3vq/TxIg6D+kq5FNOFcTIjTqPdCnjftn7XlH+cdO3sxC
 W3cWLr4wJbehRCrQHrQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1MCBTYWx0ZWRfX54hI1Jxr2l6k
 FLyqowPsWkMYB+1GFxYwkkoGnKjZV8ev4DkT9cZvBiabAQsYhQFBkN1iU5f0HHsUHKfocK1g4ar
 yxPQIuUH/r7HIqUZ2mbLSBRKy8ILlFE=
X-Proofpoint-ORIG-GUID: Su8FRhoqukeZilRQQhmP7R4AbQuP8to1
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad8b3ae cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=TO4f5atleJ8-af2fB8MA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210050

On 10/4/26 1:10 PM, Andrei-Alexandru Bleortu wrote:
> The Ubiquiti UniFi U6 Enterprise is a ceiling-mount Wi-Fi 6E access point:

[...]

> +	keys {
> +		compatible = "gpio-keys";
> +		pinctrl-0 = <&button_pins>;
> +		pinctrl-names = "default";
> +
> +		button-reset {
> +			label = "reset";

Normally we do sentence case here, i.e. "Reset"

> +			gpios = <&tlmm 24 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_RESTART>;
> +		};
> +	};
> +};
> +
> +&blsp1_i2c3 {
> +	pinctrl-0 = <&i2c_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";

Please keep a \n before 'status', file-wide for consistency

[...]

> +&pcie0_port0 {
> +	reset-gpios = <&tlmm 15 GPIO_ACTIVE_LOW>;

No wake-gpios?


> +
> +	wifi@0,0 {
> +		compatible = "pci17cb,1104";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +		qcom,calibration-variant = "Ubiquiti-U6-Enterprise-5G";

Does the same calibration work for both radios?

[...]

> +&prng {
> +	status = "okay";
> +};

Please add a preceding patch to enable it in the SoC DTSI, this should
never really need to be disabled

Konrad
