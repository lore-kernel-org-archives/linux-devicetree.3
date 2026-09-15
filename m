Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DA530146C
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466606; cv=none; b=DuNZXP0J2h5ozSjGcIG6C2Agj/Zv2FrXnQwsBCQs6CckZ3VuozrC/FOoIWyzQ7E0Len5mcr1AMRY1f6aI0PW6ATL4HfIhWk0sVZJ0NaaSaTpZjbACn6+WAyZs5bOkF+1AUxg2F0j3a8kKu52pX1uf7Y6stKPcjdy7VJf5hQzMxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466606; c=relaxed/simple;
	bh=DqLz3CVaOkJKMiv6I814QjTMGepAW3+QG/w9cl7YcQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y2hc6i+Q3merT7hu7w9/KX9OLMjdTuORXIYrwgaWcRGb2U82cZvYAOFBHsUGXhjsuo8S/ivYur8Yt9ep+tW03knKxi8XpGXC77JESDSavpiEYygWHfx/b4Hbu6LJT5erkvwK1JKvpnFIz6XHRV1tn8gz11tlMgvykmLPomcuNxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IDDzLiDV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JjqygweM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IDDzLiDV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JjqygweM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9gvNT2584512
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:03:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=G1ad/3WCjsCTzE/GiZL105ER
	EoUAK6knU7/Mo7EDyCk=; b=IDDzLiDVBmRm8Tssh4tUSuuK1mlIUuqHqJjXLZ7g
	jHsIk9KOW/CtEFwwnOgIKL34dxsoYBwjS8Z4+Dm7brjSee2/IWHSYhX9Laxbk0NH
	wrB3+4V8jYIM3AVzydU7/LRH5sbaBBj7tD3WihJTydeBmKTEvLOderWTbg7Fsa2D
	DqIzlcQwkwETUR/Vhu2hMFXldGyYfGjnZtHoj/esumCzAbwp4XWVecoKjBFgCYsU
	Cuy2HG+jV5kkvOV68bQA4psDIhCH0vBJJIhzjh/za68IPTrS7W1zF6QjEIoKGLvA
	pxC25FTFqjeg6wgjrpP9Y5G5syvxrV4OeNJhSnpNlMthlA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpx4s9evw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:03:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a0b66ecd9so350561885a.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 03:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789466604; x=1790071404; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G1ad/3WCjsCTzE/GiZL105EREoUAK6knU7/Mo7EDyCk=;
        b=JjqygweM8loco/MyrLkIOBfpw9mBlwcszO+OlxrZf4EXOxtukkuRFC2IcW309Ls08Z
         vPtJvO2VahPiC1f1V1QrDOr0YrIPM9AejqhY3a3jbf8AnfRa2J0dgJOoqTvlGbg5kzVn
         zN6gdUy+k8qCqRthqR3AtJslYizO12lbgD6ymNSCjKsj3Bw8SbDAWhtRtq5CqFg0Th4P
         L9ROZwBAgsrMFy2LodQSE7enqcgDRLs3Lv90hWm9tc3MgEdAVXptYJ7cFjHASS83bZcW
         pibPdUPuWqpg+T+q7TQ+qwPiu9jB1AJR6qku08t92BwvKxk41krTphfDqX5R/Dt47NDS
         YKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466604; x=1790071404;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1ad/3WCjsCTzE/GiZL105EREoUAK6knU7/Mo7EDyCk=;
        b=r8DwccN2/QeFpKjWOJOb4mIWKurVCr0grxDlDqI469vbCV4VBNv5ENEcK6Yl6VdTiF
         lOyzJ/cn0R9HmCHk3UniH2nKRMqFaVtGAOIMz1IaPIPg/nYqxtgylKKuYDNxfLumkLr+
         c/Mbb0sk5PAUB4kYf/ROUsVqA/5ZSFVmDrkj9NjWu4hyP1eyPmA8rHJtox8QtaAK/CLx
         002HSfKM+4mxX9myb/I6DvPMdlNWTOvkLyVUy+uy1O+/DMtgCGJthdUpLCow4l3zlbR2
         Yj1H55uVbrVjFd7IBuGvT7Fce4I2j9Inz4ldbio80GgrS6vIrgzl66NReR5WcGvfW5iA
         +NYA==
X-Forwarded-Encrypted: i=1; AKwUvBxjdm4wjc2WjhQDxms+L1AXUbCW5NwrA2FNU+3CyjGn0YMCOBybzJNnva0Ln9Ws9Gdwdr4g82V0N+zZ@vger.kernel.org
X-Gm-Message-State: AFuF++maCzU6NuRwor06suqPzu+WG02+EnXYUGIY6d3Wy5HY18nBZPvM
	3ASZUscIdcqu3TtBqhnckUXdrhUULdPejNvRDuagTUVR/1MEx3zRmqjXP7LH5Qy1RpduA4crm5/
	Rxvxuu2sjcT32B+NmsuB6VqFjrKVP7oB+hqMUUQX/DXafoBPtGBLNb0wuV7V6gYnB
X-Gm-Gg: AYBFou1hZRMKXEhjUnEcbqNvV/0gRKxYOKO7BqZ8iVotXqXs3xhjfJ1crdMXNaehOOp
	ybGJtSKcKn3wc5CDiVr2kAaqDhYgAFdslbMm/4Uti4G+Yctr0zSS46I0wnMg1DZweDinaw/56m1
	ke7ix9JjdFSEHXNUoT/FxN7TsWUlRzYzo9h9aknJMIlgwYGOIp282rLll7WsQpCCVQvMBaSjdRh
	lMAj26JE93VUglnVBdm0stoxbXc3+yh5MOkwCusjAFQbE2tQ8XMAUEq/MBaev77Is20FlIIAuMm
	ieAX5EEtIX7jCqtRucMnMBHNUYwlV+o5l1t4T1NK+oEdZ023FVV9ztG/bQfspxVuU3IrHVi0F9X
	a1AxhOCMZsVoxlVY=
X-Received: by 2002:a05:620a:170b:b0:939:fbf8:b5c8 with SMTP id af79cd13be357-93a297f933dmr966287585a.13.1789466603556;
        Tue, 15 Sep 2026 03:03:23 -0700 (PDT)
X-Received: by 2002:a05:620a:170b:b0:939:fbf8:b5c8 with SMTP id af79cd13be357-93a297f933dmr966281185a.13.1789466602867;
        Tue, 15 Sep 2026 03:03:22 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d69555csm59453865e9.4.2026.09.15.03.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:03:21 -0700 (PDT)
Date: Tue, 15 Sep 2026 13:03:20 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Oleg Keri <okerixx@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add the
 camera privacy switch
Message-ID: <6gf4tswitbxhqatwrcdzve3rv3v6boxljnk4hjptwc5js2qzo4@gr2i4zbcehq7>
References: <20260914094201.14009-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914094201.14009-1-okerixx@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0NCBTYWx0ZWRfXwsvc51OZYZ3k
 uBqct2t1KQDpxD+IupEyAYehCWnWhfq9v+q0sNgjYJzmNPNimYU8NIjBVe13UQQAPcwnERAJsl+
 6R4geGkSbOl9j8hQrV5/8f1cjzS/etw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0NCBTYWx0ZWRfX8IUc+yMomiB5
 x2tqGu/7L/ChxI0+TmnI5rCdVHNVsyn8qTCHF6FkaGxxi+tjKhavlAajSwprCx+9YsvGqX5Zcb1
 YJhJgCJPDy9uFDM+CNqc6JQg3dwCe/H0Xx6nPd/zuv/Mu7VnDCojpeLdY9BgY2UwIXXJZ3KkFXv
 k7UCB4l5SSs3dOHmGCeB6B8u4GQv3N/QCVTG4RQ+HWDir00eV3A3LQPOA07CvST3MT1dOJCPfnR
 yy74XoPKIp3OkqXlIRqoaaBxv58/R/mADRlZkH4MvkMNaLLm+zMTqf1cx7xVCJk0kBNMENgZJBV
 fzdjIWFvoHQV6Jovj+TazKNBKhku4tXnNqbWym56RuZPtbG+6HMjkOARrogjE0DjWsm7PE+PF6V
 OgK3LlMwqFQ9qw39XBJeUuiMhACQJh+89E0unueL4Q6qboXDMTqiMmkTOeCs/m9sAuFdHFQWgwk
 Pvfmvn48tyX/6KhDUzg==
X-Authority-Analysis: v=2.4 cv=HsDjiETS c=1 sm=1 tr=0 ts=6aa917ec cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=FRa0POnFDbIyqkxKNbEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: K4IbtgGJoMPT0QUQwkNYEwr69Cxqjn7g
X-Proofpoint-ORIG-GUID: K4IbtgGJoMPT0QUQwkNYEwr69Cxqjn7g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150144

On 26-09-14 11:42:01, Oleg Keri wrote:
> The laptop has a camera privacy switch on the side of the top case - a
> slider, not a mechanical cover over the lens, and it does nothing to the
> camera itself. TLMM gpio99 follows its position: high with the switch
> open, low with it engaged. Describe it as a gpio-keys switch so userspace
> can act on it.
> 
> SW_CAMERA_LENS_COVER is the only switch code the input layer has for a
> camera privacy state, and it is what the Lenovo WMI camera driver and
> Dell's privacy driver report for the same kind of electronic switch on
> x86 machines, so use it here as well despite the name.
> 
> The embedded controller also raises event 0x29 whenever the switch
> moves, which makes it tempting to report it from the EC driver instead.
> That would be the wrong layer: the pin is a plain level that tracks the
> slider position and needs no EC transaction to read, and the EC event
> carries nothing the pin does not already say.
> 
> Signed-off-by: Oleg Keri <okerixx@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
