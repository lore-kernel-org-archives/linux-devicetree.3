Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD1831354F
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 14:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014062; cv=none; b=B8qOZSDqYpqJPrvRnxws49fSADinkiMHiSszXY2Tg/5JRtWycSSXLdu6ZAXs/WTInln9ys0TtmAFlYHa3sNcU4ZsCNNyujIOuGgANDG9MkuTvvkkpk3WJMYXZeIKruiP5B9hj3qYRVw6UsLvQnaWvDY60weck6XBxY50JGNCu6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014062; c=relaxed/simple;
	bh=cLnvuyhUDxRli1mmxi18YHK8So+HlU3fZNMEkOnKa1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n2WSN9F9NVIYEx97CMo4g4ycuFt41JcN0ez9AtS3ighmiY2TySQplOLUhkyxaY8wXqQ4JSdEqVKYcQAty1CkMcmyBE7jeN1AE5EqgIdz49eAE8r6TMNB2gUqz2JjMwwbepKnJ2ocixAG3+/eNrrhTvwIdLsAgZu9LV8RS4W9sQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L9gk04SR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jratY9m3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L9gk04SR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jratY9m3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659Cmm8C2700902
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 14:07:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lp/L6GOkz32D1rojCKCm9+SClyAyCdF0rMaHBiwhoZc=; b=L9gk04SRsSkyFOgt
	GJBxTVnaGRvQUUfD5VFuUMbKhAuSx4u35f6X+H0UFl15WmnNGaSuh0zRRfvh3YWM
	7cFCt5qnJk5cgwuJSJPlfW7KY2tt/rLPJQgSst3b7HWaAfA30iyrCaLtEhrB5Z8V
	tAwGv3Hj0nldvoeIEzdq5EkaUbvCYJqQncOBRIGwsWAhrQJo6F5yq1h2OKPx5KIR
	+pv5m/vN7WoXHQHg/hImoNTm3lfBS2hptYdzGK5iAB0DxrNUJE8Ddwuhan2C84m2
	lk3inFAuvzlk2NBhNyG0f6iduMEXf23texs93luyyCcS9JcL7IpvlP/qTg1Ng6Ar
	GStpiw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeeass75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 14:07:39 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cfe512ea6bso237026137.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 07:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781014059; x=1781618859; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lp/L6GOkz32D1rojCKCm9+SClyAyCdF0rMaHBiwhoZc=;
        b=jratY9m3EJyktTZ0Bdj5Os+P3358g/NjIu63yRjF4aG13sM9RtUsRDOIVd1gQJcvhm
         l1DOaEkGCngmiNRXh7kimsQglm1VMhXUlqA5EEpYrmEwr9eKyJEhWc59b6bMH4ioEyA+
         hxE21xtT1ol7doaaRlCN2JxqaK08+VkHdNtHWJpcc+pYpqtLF2Jf5Tc7XCn/UrUL8LQd
         3V35mYds5THygGaM70jrZ2xiBjMAfTTV77+aX11Nf9o5exmDxniXEvnVySXlR0zfg9H/
         fi9RB7JLlT7f3A0kY4o85UVIfzhQcT7dmnmvLI0Xp5z+YSSBvGiFw70bAMr3bx45nRRX
         Vl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014059; x=1781618859;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lp/L6GOkz32D1rojCKCm9+SClyAyCdF0rMaHBiwhoZc=;
        b=rEG86jpJ3U3IrUF3awWhUtfrKS9VhFpJXuReoDq8djsAEoU92U+mUcSv/GiK5P9RYp
         5L1Xog/kt3CsRlz6BtgnKsW/nt2Z+x2ZU3Tcq/TPqaEfM934Y8k/uDswqMPJdtrFNidk
         xWt1KCFu/1kc00emqPARg17ZjZ6ZPLLaXU/gtBaN7qyumSfNc75V8kt1mR8MOK2+uU6K
         xhff5rYSECUC9FKsTXWa7OQVGVwSr/sJIWee/2iPiJ0a6WtskeYHCu8kytOSkWQRqVLE
         Z1tAaHmm2Ch6NP+R6wxqZUrS6Lz60R3BKDh44z5bS0Q6lgGU/tOGr/Uw56kBrMGK2huD
         HgTg==
X-Forwarded-Encrypted: i=1; AFNElJ+hfm7W6H9kPYyrOhLlzYhNbX6lMehKic59frW9bbuDQdk6tKq08ejLkcBfu1pk1on0I94AUIq2lho6@vger.kernel.org
X-Gm-Message-State: AOJu0YyFehnqTxt2H4eBINl0IfX7536ul86MXTC0UYDvrKBWG633IXOi
	Nj9AW+XmtWOUWnhc/x06kdb700x51y6bCk+BhjWsOB7Yhq7B6+1TjixWLIqxlrWoV3IFRlF5KT6
	6eG3xC9SplwbZBPG2GPKIwAH1K31GI4P8Gty20zdiAdhn3l6z4s8K58flLRTHKvds
X-Gm-Gg: Acq92OFB+fK7k6DVaLnXkPp3AiQRFAMRE361EC3J0XTOPy6pW+LFkpSWcEaKpQcnEQk
	cJcSz3scHoDUujXLCrXbMQbzTVpDoTICo0wjTU+2qQlKN05/5P05kX+Nn4pesweAvPaUJbU+LW5
	pWETr9aGx/+mr02ulMx6HT56eXPaxvZvmqLhxHrp3A8qg8VXl39m+Zt9SF4h+My84bvR57Hqgij
	ey91WVmNzeV3DRR+yMJy7LYVBgG0gaUDqHgTb/ED08JymCMj28WClnxaE+aBGee9aQq66JNCwFM
	dAhi0/s762iiUb0fi5Ixc1BHb7H3fupfWox0nsUb5tYYditaCS4r4zy/LyQcLbMoQBVHvcA8kEc
	8e4PipxYPjYwt8KBt0kEGHbN7GvzdkR6vAwDvQOSO9K51e+UOKzMrDDna
X-Received: by 2002:a05:6102:548c:b0:633:3bf6:977c with SMTP id ada2fe7eead31-719160955fbmr459236137.1.1781014058971;
        Tue, 09 Jun 2026 07:07:38 -0700 (PDT)
X-Received: by 2002:a05:6102:548c:b0:633:3bf6:977c with SMTP id ada2fe7eead31-719160955fbmr459224137.1.1781014058545;
        Tue, 09 Jun 2026 07:07:38 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0559eee00sm1064314366b.56.2026.06.09.07.07.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 07:07:37 -0700 (PDT)
Message-ID: <7e04a133-05c2-4137-9ac4-c4fd4ecdd505@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 16:07:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] arm64: dts: qcom: mahua: Switch pcie5_phy ref
 clock to RPMH_CXO_CLK
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-7-ded83866c9d9@oss.qualcomm.com>
 <db074223-ac01-4ffe-ae82-187ef0cb2cbb@oss.qualcomm.com>
 <245e1e8c-45e4-426d-9c0c-4c2c0952223b@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <245e1e8c-45e4-426d-9c0c-4c2c0952223b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UjDySMAWpUCM6JeLyPnN2x3BL9ITRPqk
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a281e2b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=aQRuXO-KHT3Wpr6myUEA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEzNCBTYWx0ZWRfXy1U/bdyElYi6
 3HLr+8Pjwje54PmX2YcDx3K99Wb5KLThgaewdigchxLFUU0q4jD533VmAYMuSwjkt+2LrTEpFoX
 YxOsyvhiBNP5HAtsaDi2jAo/fegSGqxJoeJF0L9/JAi48D/Oz6CrMznnb4YNLy56YCF0jBIkjS1
 LcIyCT9jQ+ak5gwlwqCWV6YcMjtRT/kMMtyzuDMEB485Kzsd1q3HkIxHcl4k6yN6OrOwkdwjnll
 4hfFDozYKz0VmIu6tG4KV/o/zIq8FHwX31bPYar9ngEVN4DxD4vJhN3SABk0FtV8m2jBkyyrurW
 x/A6jcJYnazmFVHo3WzqxopoR90wvbcmFo6o2JTAsIkVSg4CO+FR4zUTMJDDhNrLeh+6LzyUo1l
 JsaOegsMVPkc7E+tfQtAzPpwSfStKTV7h6THR+JNgSCya2muwTwtL+mKttJ0npIOyh7uyZb3012
 bpTFB3oFCRQPUWSYUAA==
X-Proofpoint-GUID: UjDySMAWpUCM6JeLyPnN2x3BL9ITRPqk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090134

On 6/9/26 3:55 PM, Krzysztof Kozlowski wrote:
> On 09/06/2026 15:06, Konrad Dybcio wrote:
>> On 5/28/26 4:29 AM, Qiang Yu wrote:
>>> PCIe5 PHY on Mahua gets refclk from CXO0 pad directly, so no QREF
>>> clkref_en voting is required. Override the clock list to use RPMH_CXO_CLK
>>> directly instead.
>>
>> This is the last piece of the puzzle that this series is missing.
>> There's no QREF clkref_en, but there is a refgen that needs to be
>> powered. For PCIe5 on Mahua this would be L2F_E0 (0p9) and L4H_E0
>> (1p2).
>>
>> I think the easiest (laziest?) solution would be to add dummy clocks
>> in the clkref driver and only toggle the required regulators. Another
>> option is to defer back to individual drivers (such as PCIe QMPPHY).
>>
>> I kinda like the "one central node to drive power" approach, but I'm
>> not sure others agree, since it stretches truth just a tiny bit
>> (although not as much as one would think since there are *some*
>> controls for the transparent-to-the-OS hw pieces in these paths still
>> in TCSR).. Dmitry, Krzysztof, would you object to that?
> 
> Not sure what you ask here... the tcsr will get the refgen supplies and
> that's all what is needed from DT.

What I'm saying is that there are always-on clock branches (no register
to control them) which go through controllable repeaters (with a reg in
tcsr, although we never control them since the reset state is OK)

Both the repeaters and the associated refgens need power supplies. My
suggestion was to take care of that by adding "fake" clocks. Currently,
we have e.g.:

&usb_0_qmpphy {
        vdda-phy-supply = <&vreg_l4h_e0_1p2>;
        vdda-pll-supply = <&vreg_l3f_e0_0p72>;
        refgen-supply = <&vreg_l2f_e0_0p82>; // the other 1.2v refgen is missing

        status = "okay";
};

The refgen supply is deferred to the QMPPHY node itself, and the
repeaters on the way are ignored. The "ref" clock points to RPMH_XO.

What I'm suggesting is that we add "fake" (i.e. uncontrollable) TCSR
clocks, such as the inexistent TCSR_USB4_0_CLKREF_EN, to which we can
link the required regulators, both for the repeaters and the refgen
source

Konrad
