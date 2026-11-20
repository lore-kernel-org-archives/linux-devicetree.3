Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169570;
	b=YcGna3ZG25HLkqjAH4CCD6X/Vr7PSADw5xXCKERkTSa/6UR5PIIiNxEcGeyJmhCSWInD
	 IwyDZAu6xBWZkXK9e0fmjeR9M7evua+0HH3r54MW885DPl6SqOQ/wcsNCVjn4WK6xk6ad
	 5En3T2lcvQ7jIEpgwmO320VN0GDvS9uDAiOgE0BGmYF43ywZldvHak9IcRwJwOcvW5uEw
	 xHhyttLVr0A+/P1v91VuEN1iccXbWq8WnEpMrLaOqlD77+/1cCZK9Ozs4T5MvOOiobZIo
	 Ss1XxMUTlskL+z6/8qZGoJhduFpFQn8Wq20GYSt7tZDx7Q6A5/cgOUw9/8AAI5knQJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169570;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BYSlGEtU75YElxD5lJINvAQFMqsMXtuHFnBFwhEDs8U=;
	b=x0wvzc2L0TfwtnGi59767nLk/kV8K+opSYTgHFsTZQvsQupIUMDFZzjWlw1ywRSYUKsB
	 WDNTn0SqSX/OTMSCWTtRAgiM69V+TfgfGvYDhbGSM2DHSnHTvJVX5Km/NlbhGooRS0wK5
	 aE+hpWpKw9TQCz+QXNNqC+YYIktgIQgESyJpVtt2l2Z4A2YSaOgxCGuz/+Zzcd2CfqH5p
	 wx8ArtgPu25C97uYkm0OducVBQeJtpQm6klOA2ML5ertwrXJ14JWiM5uDzGqmjW08TCj4
	 C9WqWMJbco5OhhPZZzr74NOfE1Ccjt7LwT8OHyoIgdC+fzG5/iOJwJp+a4kzCyyjSlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OuzWMIja;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d99DNyi9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0917606A326
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0917606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OuzWMIja;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d99DNyi9
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7fOZW650516
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BYSlGEtU75YElxD5lJINvAQF
	MqsMXtuHFnBFwhEDs8U=; b=OuzWMIjaj2D4CNLoBSuJtqqSam1WrBXTZkGhhaqd
	j8bdTYi3KvcZP9jenjLlPtdVrWuM7MsE6Rc/We6Q4kAbUfEcIF/fmMdTEy5b/L1x
	iodrUkmSUCxsNf5RJBw8YQ9MXCQOJFJA9IUSMJ7dMk3foO4Ows8JSLcq0bRFkSmG
	j6e/MUHhYiGqPoYVYzIfHZaE+VodUJz75OY/eVakvEBUWBh67ZuDX7kRdm5PhxF5
	8JiHgRjxrCrBrWNmPLhlBs2p13Nl8OwFgAMSGY2L8wfFOx9K/VjBHal+PAAphZD3
	iWRe1gbS2rcC5MHV6Z+IPa3Kn6NHihnqGHFqQitOpMlhDQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fyk4uy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:12:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f33438950so136140185a.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 02:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795169568; x=1795774368; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BYSlGEtU75YElxD5lJINvAQFMqsMXtuHFnBFwhEDs8U=;
        b=d99DNyi9Or35O3bPY1BXPVgy/15/SwziMuu3cJIFzkrlShwlxk2M8Eq5WLNz/zkm/I
         Lc8vB3OA1eC4upVrXOLkl/rdbGWW/CzpirDtXgaB2Hrt9v3CrcFPbqdCXNejjl6ng7Z5
         Bc4bpPVR9nVs6HWOCjopP7Gu5oQGuIeHpKPRmAOUAoMQWAr44AWUGlzEUCkiU4ZHl2kn
         Bv45CI0dJV1IEs3kglFGseqo6WX5oZYju3YZOqCSwFBSmFxM0SJuf6/uKfzzFkQRbYb+
         6EMHxHYHMBCeTcZNZRM4aoP6ynGF32xgUUsGACv02dtqZ4OpYZMqXggYOCXwV5SOCvmi
         46dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169568; x=1795774368;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BYSlGEtU75YElxD5lJINvAQFMqsMXtuHFnBFwhEDs8U=;
        b=zsdgaE0tMK2iIWWTCoTc+QJVhVdq64S85DioFNZsoU2GLfUKOSLGzlCLeX7J73Wgns
         03GVbWS8Wn89zN21SGk5pLHN3neRpd8DtMyovYwi9vwHWR5oLESUqzJLTohdbX7bXSDt
         bDLQmi4EEnTfwJ6KNuDZEc3pW/xzxwDu5eIXrm4ZsXVGVXFwLrk96/AoPqGAtFrzi45B
         CU1aw9sT121QPiChlZ8Wzx6Hujy3taqzBhKpmK8B0KrdnycEh/gImGqy30v3EW6nv+9h
         9vn0N4wgHl87Y8omYMzb0QjWxZPPDJidmQXTgjvwoORWJU5mmtpjKDfe+LDmlqCSxQ42
         5a+g==
X-Forwarded-Encrypted: i=1; AL+hErHp1vpOV9tDZHw2XxQeEy8kFt35zbU/09/9v22N/9TrpEKXaRkUDjDxI1OHPBYf+TeDI15iuBpTm8ii@vger.kernel.org
X-Gm-Message-State: APuU4Z8TmMSiR+N8Mtqzn4AZDm/+3Z3FoFXT4WKgRadx61B6Goewwbx6
	r/6He9OciApo8+W+A+Nk7aHA/sDsZDwqvPvlzslHeJDRFvhMUJ4e3KFv4fdMPql/3GXIavK+gtW
	bVSNpVHLb0GUlXEq0qB+HxtboskS6ScAWf/GPEUl8V5cyAe43Cz2DAzfufxWa3qye
X-Gm-Gg: AYBFou2SdSjbQ00+FfHL8R3Z9k0H3PcY0Pgg7ym8O+yaCm50f0JD7QkVwBF0ISmHiPQ
	kBz/DVNDgXukIPtlYCgQ4yyGkZYcdh24OOE/ukhFQ7aZjzhYBsuPpDgoo1WuJV8JVHPLaMAk4Dp
	UQW/vgBhSyZ8OJtIzAHF54eV5kpqBXLxc0M84dVvOp4jGz2A5FPdgsh2KbqJfrLiglAh5jzfPhy
	kmirR+zSiMNbzL+xSuspI1FMTWpncq141MZfPK5Ob9Zu0KUEDK4UhrjHbE5ueFw+FxLVSCLzZEf
	d3IWjh9SAPQszhKxXPflf2VfmdaTMtPEUE0Xgull2Re6HuYz3yoh1Zj5nOiUnCRtaBV2Phtynr7
	yVXyQ2/NeezeAhBVBHAeyRdY/VmuROcW1KwnkamcCUhYcEx0HZyzzroaNHG5pExSN
X-Received: by 2002:a05:620a:4612:b0:949:7fc8:c71a with SMTP id af79cd13be357-949ba80f896mr464639485a.3.1795169567702;
        Fri, 20 Nov 2026 02:12:47 -0800 (PST)
X-Received: by 2002:a05:620a:4612:b0:949:7fc8:c71a with SMTP id af79cd13be357-949ba80f896mr464635785a.3.1795169567099;
        Fri, 20 Nov 2026 02:12:47 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm104468205e9.11.2026.11.20.02.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:12:46 -0800 (PST)
Date: Fri, 20 Nov 2026 12:12:44 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] clk: qcom: Add support for Global clock
 controller on Halliday
Message-ID: <llizdibjhqld7dbkdwt3vz2oyeiqsqb4rduunjlnthmhy3r3c3@vct73wnh6kpb>
References: <20261116-halliday-clk-v2-0-28208928da36@gmail.com>
 <20261116-halliday-clk-v2-5-28208928da36@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-halliday-clk-v2-5-28208928da36@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfX82hsoXGeYC+3
 YRiyZyntH8sMjc0LHs5YH+T6gn91xXRW4UXKkzrBLvrY8Nl3TDiYwdggPTNa4Yj2e9yGlb/dpDt
 dqrBgoHsDqYum8+rp/1YUSVzOk6Ypwo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfX2pTrIC422FCc
 xcv0+3xNfBgQwxCySSPN4yx083SJC0pyFagjfGReMyFNUlgwtvTSObWbGzvEo7GIlHRIKlEJo9/
 CWqoRKg8EJ/YIU+e6RU+8YtAkP40/v2e14hM3C1gMm4HDc4s7N71itIe0vbYs5b7UMrI13Gasce
 YTvkNnCFbC86kqC2pnq3CKsQTO4uDCiJ2r93ibO0O/Pjb1Yz1OT3GmXZzbHzbU/ImDkPkFZjS3N
 VG/PXqFTRazZiaoXjXgYjgK8U+iGcp4DWCbzm9YaaU3VbBSxeX3lKDGZt8L+iVQKF2C+5wwczPE
 uHIyS3GkirJn9PWrhvqVpKLK4/cnor+EJv37XZD7iqw+Q7Pyx9QZw7z/xYouCDkwJiPgsIaNf3a
 XHyRL4cKSARvpTh+pZ/FLB7MZOHyopHgBDsAZE48mGLzYwyOMdwZpifjUMuQ9zeCglVoVhWjUS2
 8Q8GcT/56zKRadpmJYQ==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b001d20 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=QvFfK8P1GQIJS_-KitYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: R_VqRmMMjOrLO4lrQz9T_U-J3bhCm0Jf
X-Proofpoint-GUID: R_VqRmMMjOrLO4lrQz9T_U-J3bhCm0Jf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200040

On 26-11-16 21:24:23, Stanislav Aleksandrov wrote:
> Add the driver for the Global Clock Controller on the Qualcomm Halliday
> SoC. The clock tables are based on Qualcomm's downstream gcc-anorak
> driver, without its hardware-control and HLOS vote clocks.
> 
> The eight clkref_en clocks are clk_ref clocks that vote for the QREF
> supplies.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

LGTM, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
