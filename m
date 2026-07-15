Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00E743FD35
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784111098; cv=none; b=bFxFdJ05KIzdKQBPa2KcTrjp5pZDOpMENPSGW7tw7dWgbXgp6acZmS4Gbd7lSkI+8lv4oQX1cxvreZGBzrc9Rgmniuj3YwIa04AN6MWd8N24aKufKUGL/MUL+GD0awAL2WuU0ChcZZOiUH42RB3Sg4z5HF+GdCr2whkBNQp8nnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784111098; c=relaxed/simple;
	bh=APZK3QW7cpGioqai+n5uy+Bx7CdiksF05hrnwX8+Kx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CTkFb2RA9Q1ATfazlIkAIQVTn1FzidD7kLy/eWCRf9NGaQo8bbiH3OzSC2/acsjHtjAWeHdIOuGjc/8gKNmoyyLXhLy0um2OZFyIRr4FCxUlT+gmMC2M3AsBXI+ijoG5+0owPbGm7mPpVFyN56H00YE87OhuMlMcXYJ6+df0IMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BdG1WxD2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MKXYnoGV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BdG1WxD2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MKXYnoGV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F9vBPs2269540
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:24:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xXD8XeEklW/BA2SpXPmFYJa2FPVm4Auqtf+sNXE6kgs=; b=BdG1WxD2JeHqB6id
	JHjHVvtiE2LTnOZ02nWxkCe9O0lhPRnMQCsJ5cJl1peP7DbvQGTHVGwbZnnVHx99
	orAGLIe39HYQx8iVG3SYeLX/0pLzKH0RESUWO2RBNXTA048ADDqNDaK5z6gL6D6E
	dczFacj5uLpOd+c13FB26TXYEjjjx52xrmIkE8vxDfLCSznVxEIg/djUbf+dn18L
	bLHaZn6QY//XyQQXR6cKST0gPNBsjYO9dFctmSDvItMgGalYezhYTfilYKAk8UcP
	e2ZDAoNAOdcxyd0egsqChyJpF3etXCOouwLcKwne2yHSjs5ywmZGdHjnxU3fjKv+
	fIwm4A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9mk58f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 10:24:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfe75b7dbso13614091cf.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 03:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784111096; x=1784715896; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xXD8XeEklW/BA2SpXPmFYJa2FPVm4Auqtf+sNXE6kgs=;
        b=MKXYnoGV8rYBLTANHXTGd3YMpKlWdhaaXB60sQCCRNLWW43ticRDTb8yVWZ+oFQnQH
         Mry4P4oM5LK0EXA3todJ8Z3UkIjZESijkL7zlbjoICjpxmX4dSkUGzJnG9ruxtw/rBEO
         wu1XXLT4E2xBPdYP//uJDy/Nm17fLcGaYqPl8xLl2VMKSLo1nGqjDVv7NIEF84gxZjRt
         17WXhNY6nDAYg/qzqfNYF8zTiwopz4U2XSCeSjej4xSDwSC9CES1I08bKUiRtkugAh0A
         VgIrFqpzKypbT1QPpbXGKwzLAysGPA0mCEkdd39PW9sa29iJn8zhLKlRDRurFKJ0lrfG
         pZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784111096; x=1784715896;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xXD8XeEklW/BA2SpXPmFYJa2FPVm4Auqtf+sNXE6kgs=;
        b=petr+Rz2Bvu48LTQL4gPgLrY2Ef842EVtcqGv2/xjRiI0G+qEw7Wk8OuvH5INfs7Cn
         ypI43Q/ts0B5+AWVZDo7N7plol9UGCO6L6fFpzb4KbEY1mdAHOyYUNb4EGVYGqOoPEFd
         /XlGH0YHOlDBXPskelLj+5KQNi+qr+j+Jb7elxL7lvfouFzh5F9ToyAQZ40ayLFNLRoC
         SuJ82tWrd9fZElXUx85QjWFZU4JW30WwzjNHUBJ6lZrPSxpBdut/h8cnZOKJnNNWmJaX
         GCQTJGZ+s6c5FZ7sOtvvB7y10qBhEKkzWWHzj3u4CWN9B2yH5EzDMej3sPcdqFg9LSUe
         2PBg==
X-Forwarded-Encrypted: i=1; AHgh+Rr2FxoIASMnU/g408wr5hD/UZsLinJi/ZbrEgeQEDy/DJAvMH/5zv6oU53R/7cXoocwCXew34LnGoFW@vger.kernel.org
X-Gm-Message-State: AOJu0YzB99jMDfndZjvVGsO+D8S1KThZ2SJoSp1lK7K1t9EV0grKobGb
	zqo0uMMQIgW9DntxUhJBXKsTOsBSsKF6mJ+MEAQlMypNXwp2ndWUNu5vtMXNSqpAINDypFFiwck
	SsGm27oh58+TlD1DXn7Kb4VdiANCSPAhFXWujys7aYeJraKanY6fAB78gHzaQ5Whn
X-Gm-Gg: AfdE7cmZ9aQVJ3mGEmHcBlVo5/oH2F9ppYyH8mK6aopUDztfoDvBnWSLcDCbAKuS4CW
	mpHNs8nWr3hbtTAl+gUP22xlv+x3+K+zUiv0SBrXAXMHAcUR3kDcC2OfYVe3VbaxrPCXOJEJQdh
	mev0pRClwLzJipDBfCFF6ZjY8pqLEcylC78Z2U9k2+PiGb4s15oIBWCIevhPEn60VftcUPPv5Kb
	oLUbODwy4hz2SL8X2zXjOt5PRIUXoVhNO5vHZOhD6nxPayMeX4ok50tF3vhoGe2yLy4GLIYWHCy
	y4fUitlVf8vmcL1skpxEWfXMl1p2fp2x0GcI3W7RXsV9QUMUDn/RP52djijJPe2eJvFBpWSbkyq
	uezZkkHq2/FFZplXkFhKM9D6sZDhOq347ilE=
X-Received: by 2002:ac8:5d4e:0:b0:51c:1744:edf0 with SMTP id d75a77b69052e-51cbf289286mr138459761cf.9.1784111095814;
        Wed, 15 Jul 2026 03:24:55 -0700 (PDT)
X-Received: by 2002:ac8:5d4e:0:b0:51c:1744:edf0 with SMTP id d75a77b69052e-51cbf289286mr138459521cf.9.1784111095344;
        Wed, 15 Jul 2026 03:24:55 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1687166b94sm233266b.17.2026.07.15.03.24.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:24:54 -0700 (PDT)
Message-ID: <991fea96-8e70-4792-b8f3-c8dcfd527eca@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 12:24:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: eliza-cqs-som: Enable CDSP
 remoteproc
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260714-dts-qcom-eliza-add-cdsp-v1-0-525e757a23b0@oss.qualcomm.com>
 <20260714-dts-qcom-eliza-add-cdsp-v1-3-525e757a23b0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260714-dts-qcom-eliza-add-cdsp-v1-3-525e757a23b0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEwMCBTYWx0ZWRfXyA/jCH+9J5wo
 geIYz9nWxoZa4NtaoWjbt6G2iaGjqJGqEgEMBVFGXaCBw5KxwLfA9ioSMOMB4GA06v4FvsZY/yj
 k4YJLzQbgOnXIBlRxLsqwjN0ZDDUYveIlLuMsANOjrP764AZ0DWZ+4rV+kBO4z0lUvgZf03OFTT
 IDlcd4RK+KFm9gzuMshJbWooKtCVPUHRFi87xB5xPQxoWX432zdtI86hL9E2PlaMlq1mybovxgt
 RDEp0/GBRab16ns5Zfso+/CYeR56bptRcI5D93qzni7nu8yhQ/sB7VcxAZZxgCIkSvi8uSC62Of
 rr/lHdHGYQABfMu0Hqb+C3Tvm6pUicmq/uzT6+WiZrIjENiaaO0E5Cg1BZrEa+foGeeWrhoY5G9
 wm7bre0RoMyNmza8E1armloVWbe3Au/QcXbmPWGIbQt2zeJl8tRiHNbp74/d4WXbi9pxoFV4fMf
 bmDRYWEz8ElBtF4lglQ==
X-Proofpoint-ORIG-GUID: pwzwptoaZDiiYcV4aFSQ5BEYPOG58mUG
X-Proofpoint-GUID: pwzwptoaZDiiYcV4aFSQ5BEYPOG58mUG
X-Authority-Analysis: v=2.4 cv=E+79Y6dl c=1 sm=1 tr=0 ts=6a575ff8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=cb0s1mPa-qHyKy5o9EUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEwMCBTYWx0ZWRfX8kswQxG7Wn4l
 tuVNL9ZaNFj3TGeM5LWEsK/yZd5or4dOFiyR/c8jwMwA6xU+gtXZwxCWbg63+HFu00ZqtA7q6E9
 9OJsZeYM1TFvC0+hUJj0YRq+XSFWZYM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150100

On 7/14/26 3:06 PM, Abel Vesa wrote:
> Enable the CDSP remoteproc node on the Eliza CQS SoM by providing the
> firmware names and marking the node as available.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
