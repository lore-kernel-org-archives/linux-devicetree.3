Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893855448A1
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 15:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791991393; cv=none; b=L20UECmfvRTSvpucej0FcF1J1zH/nRzD7MEj3hEUej1TcvHz5mUOcj9912pEPZdIyskhdEcKUaXTJGGC1xYiyBB9htdWSfKMq5MOoKCxxXk5/b4x1/M7Vio66fkY9fDtMirqZ6zq1XL0K3fKgGNi69hPlOaBJ78Bf/X3dRMHxIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791991393; c=relaxed/simple;
	bh=gKFZyYRMaW+yGT+qZVr6vtv3tDPMrkptapq2/kB3icE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SK1EZY8H9IcIpBy20dFPVxxDQXcCeCx5Yvvsg+6DUnk7EtB7BHCdKYYIVIVp+h908Onp+MTpqMFaX/MAJFI2zSOklrl1G4nPSJOQnqUuBZ1VohCD4TWjE69++ZX0hN28aGjGaBICeewIKAu878GhhhmP6y2efkYydUmtGdK5EYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KFbK1YyA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JdRiNJNt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KFbK1YyA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JdRiNJNt"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEax5M1509770
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 15:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gKFZyYRMaW+yGT+qZVr6vtv3tDPMrkptapq2/kB3icE=; b=KFbK1YyAk2uiYjsb
	uu4AAULQUxgDXyWgiaNDvbRph6/UlWZrH3ApI8eVIJgX9xdOnjfXfQksAuHcT+M5
	SVrCo2qhRrqADx29GQV37tgKSQaKNT2/6ixn+eRerddPtJhuBqsM38p/gyJZicai
	KbV98rVTA9AKoew+5fNnl6oeurINPpvoiGUy/NBw9LVv3lZYEG+5UuG6DcqchanZ
	WIKAH8hRtD0vKSSKgmKy0hGLT9FlPFdF9Bz2z/eFFCYGw2VqzfE6fF4DHRRRWRR/
	11wRy+AQEBf8gG1VofG7d+UpFSFFqMA+v2Q0HZT/IXT392so24+3NZO1vt4pZxX3
	eHx8Ag==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sbevmfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 15:23:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc50fb0d2so82017785a.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 08:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791991391; x=1792596191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gKFZyYRMaW+yGT+qZVr6vtv3tDPMrkptapq2/kB3icE=;
        b=JdRiNJNtH/3ziQ8EvrwFXXvJdnyxUpTMzwsyunyiEa0jpjZo0h75MGxzBhl4FSR5+q
         7dnjW5o8UoQS5nuWkHzrBqZBP09scQpXeEffNV+ZGG3EgDgkG5EbLTZl2XURUHSyOJns
         pxODgoy5y9TdvokvmELW/jte8qpGtxE3jd7Q7cXBmda2yoOvnaL8Sf+2rY8Ds5nO+WeB
         hDyd4PaYaTmnJFj677L+16iEeg7neZToLzqydFy3C02zfT3wv1+Ky50h4ma5kOUE7uaG
         6R8raONwT8OWxa5t8GO6hOv/XoVQVabPc3Bt8rvykd25DVemXZPJoTGYs/IUqS2bbDW6
         3oYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791991391; x=1792596191;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gKFZyYRMaW+yGT+qZVr6vtv3tDPMrkptapq2/kB3icE=;
        b=xciZRqNa+TFEZy03+/xfVAIjOO5gGxHCkEMmmdT51piHG+GlTzIhCrUDuBpOmaq4/m
         d5atKcYC6e9Zg0fEBtx9oQZmDjlQyajnxjrrHkqULSTvlkUV7xP80mpsmFsDz/Wu5nRG
         KgH77zqea+lE2PfXjYp5y2q6EyW7O4GmS28vH99JzNrFPFD1VMsU00jqLonrNbpTu3B6
         dLo0XHo2t0jRhyiE7nycFopC+ptyVKikiweX9dMOnpdVR+GRyJnSy2GxKlMhX/80jZxk
         9RdKj6luGCkUDEKoAUMRATPsg9iTBr1z68ba5v9RV57nWuve4BLwr+Ffi7UDCcfQpDw+
         8SKQ==
X-Forwarded-Encrypted: i=1; AKwUvByry4r+5kYGCRBi/chPZPdtqoa9ehWVzTrwJUpnjILN7X14EKNwBy/uwyIFls+3DwXsOQtItAj59dZM@vger.kernel.org
X-Gm-Message-State: AFq9FYLbZZB10zUjS7Y/1VmenatM+n8vmLwkz6kyAy5vHUispV86WPOu
	AtmIdmSkVx3zehx+DGaP0ccAxJ21yidBsR2/qhCpeGf+QlN2tPbMD7YIu3IYfoA3HdCHqkwe4mu
	ouNFC23isZlkAnVRBYAdiHhI8jDjelXAcP1KrosMjK721C9yrKk2EVaQ8/W+my7Wo
X-Gm-Gg: AYBFou3iXg6mMljO93VXt0f6sbfXBkHSsuaWsWjqAM+Wvx3UCcHDjbuZvxKk9gFPyAM
	3dsOjeJ4FjbszMtuMtBS1F7Y+YdZKaoMUBZD37tHpYCoyQm3KqEfLZXJJoYDnq6Q+NtO9+wlmPE
	TJMeCahElIcDnxCOwIhZA9Hf9W5D79L070d14HhGPQR2QsCE13p22npmktB5JNk6YfqP+rIZSF8
	vWvfOmF28RTGQFcoYSUhlV2N/0M2obDVnGH/LtpcrLaYYGforTn0pQ1/OLVVS9UyLp1+5qydLGH
	b0kGgZZ+HI8rC4+/80H3XYP2Z3jpvl+ltczcrfnp0MkaKbFw2plmDJPg1/eYdCJAYNZJ0jFOYbw
	xNiT8nF/86r7Trtiei0hiPw==
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ebcd2b830mr2689949885a.0.1791991390403;
        Wed, 14 Oct 2026 08:23:10 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ebcd2b830mr2689944585a.0.1791991389881;
        Wed, 14 Oct 2026 08:23:09 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b20383a22dsm1269905a12.6.2026.10.14.08.23.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 08:23:08 -0700 (PDT)
Message-ID: <f5062eed-f619-41f1-9e7c-71a7405e34ac@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 17:23:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM RFC 13/16] arm64: dts: qcom: sm8650: Describe clock
 controller power rails
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-13-3041b788e9f7@oss.qualcomm.com>
 <su6pmts36qj4hogxfthkrvjr2aod2r2u33onxifqanbarxk3tc@36qoces4rwor>
 <2ce49c83-b861-4a0d-8412-e8b3ff33bdd5@oss.qualcomm.com>
 <lyeiklz7kcjhotj43wir7xutru5wmjbrwfwauwbyzx5jcgpito@uyryg2sbmsf6>
 <924134e4-946d-40e0-8d93-2951aafda4f9@oss.qualcomm.com>
 <555cch3ceqlonpp5xgfrtxesppxolhuedabmw3twjjfspyoj6y@in4qkpalmuwr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <555cch3ceqlonpp5xgfrtxesppxolhuedabmw3twjjfspyoj6y@in4qkpalmuwr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SM_SKWlgEl_QL4Q-vstDgd5dyeMB4z8b
X-Proofpoint-GUID: SM_SKWlgEl_QL4Q-vstDgd5dyeMB4z8b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2MSBTYWx0ZWRfX4qtfC4BTcBt+
 tc3qlQTQX0Dz5z+Y3IXPt9ruex6dl5cQJrmq9vY1eOAWb1eZG4w8BDZ+8FPgp0KnDhKUmuyEiXs
 UfHkz6SzGhAZCqHUTIhzU6MY433OQPrUaMuI6LYfl4BZP8P2elBg5VRvei19EF29chO2NM8RUyN
 6A1iX4rBjS1TQitlQpgD6lMmpU7Xd0JBVFViDX98W1NvZ3Me0zkYUado8LzIjg8EbrBB9lRQhvq
 4vSzQflblQ6q9zQaWo2v3JzexC9p3g2EXJ/QwctU87xKFexHAYVgV4ot4rDHXfGMfzRxS2xREW4
 5JYN9flZbUg+WcyWbf9bMPtTmjrT+IT65W9XJXWCW2YWHxD8ldiLoX27wLFYDlYn1FRiZOJwE8c
 a2NuXYQ/RYUBoJM0iXIRz5ltzU0wAqPyxKk4MVmHY7nIAPWmMS5tTsMQM//BX/H5jVqrABjqt7j
 ckboeEvGTqi2t0kNY4g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2MSBTYWx0ZWRfX8y7kJzztzolw
 31Jo8BjZeL2wh6iIIiXVqhxq9TFjUwslAtNGdRszeGEgaxoW5C/bkrS+6Yn+JUELRdVIUZGVc34
 qohT0xYD2el+MkgGuVVI6WTcc0GrIiE=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6acf9e5f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Y8Q4aqK4LaMswZtuF5kA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140061

On 10/14/26 5:01 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 04:36:11PM +0200, Konrad Dybcio wrote:
>> On 10/14/26 4:33 PM, Dmitry Baryshkov wrote:
>>> On Wed, Oct 14, 2026 at 04:20:08PM +0200, Konrad Dybcio wrote:
>>>> On 10/14/26 4:19 PM, Dmitry Baryshkov wrote:
>>>>> On Wed, Oct 14, 2026 at 02:19:13PM +0200, Konrad Dybcio wrote:

[...]

> Ack, I missed it. The price of doing OE instead of kernel for several
> months :-D

We really need you back!

Konrad
