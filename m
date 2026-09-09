Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89190492E35
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 08:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942884; cv=none; b=qxWASZwFmW8PPl2ozzBx5bZRxHAqG5crQZvF0/m301t0KNR5V7MCV/TZtcIesZZGTdWLYl4j/kpWca2A2TzRm50JlFSk97fC8acntUz5euFK900zlBeu012gRrLX/wbAXTG0mMf0NhMqcAc37r8z2gDzKjyp3OEJwH2UMZNxW44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942884; c=relaxed/simple;
	bh=pJPGBRk+cN1hQVyUJDNsHIogDvWgEIuloWQf73ADokg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pwzotG7TjHMfx3vWLkwKWjeffNOm3FBUSnsGbb8yw7MMEOlLc6vIB3Zec6DMt6ukb2BBxsciTK2vvutT/2ZPCC62f/R2FhH5bDyxlMswTeOVDyQoIWwjSWdTS1/Khb/sEjYyzyqcwd9/eN1BkGXIlAJhJ7bLhrhl31BN97hWgcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=juqHdan1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SWPho7pt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="juqHdan1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SWPho7pt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896YWXm3654006
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 08:34:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4SlGIdM3cTMUMV+JFnfbpS9d
	9pPhphCilaasH/UUBmk=; b=juqHdan1O+ZWqt4x4J/efiN15firYzahq6lj8bt3
	avR4jDDbLTtPrv2oGg0/Pd57mNmQA9LREbSrawBwTmRqfTC8yA6F3vyleiPyICVW
	WG6xkK7P2zazzbryJiTwaxwu3Qyw9mbTlbOugxeDxxAb1K7MR3P5EfkAih1Tasxj
	B8tkI9T2WF4FobAcLqcJbiiVFYKTiJJ0DdEqA2VIQ0lG11NYCU8+fqip6SedW2uC
	mpQhJFfmGRrGFRDfGWV847ML1QAmbHl9SlMWG/2TkYRwpZDLgdZaPQ7mHRYk4F7R
	IXH0J0pSIhcA0yfSSWz7g3XbqMvCG+N22fqEnQ/LL6/goA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjppp3a55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 08:34:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d001671a54so100913035ad.2
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 01:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788942881; x=1789547681; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4SlGIdM3cTMUMV+JFnfbpS9d9pPhphCilaasH/UUBmk=;
        b=SWPho7ptLsxv5hBYwG7flFC+MZnG92KitWhxtnzZUpmt+5G5/j/pbzowF+ZaGNl59/
         Y3oXHKJcpO1lE717syqexi7t/ErC9WyN2cicJZXsWa49IE1oeFEqnMy/eDXHC2oNBQPf
         ssEtK0T9HqSBeicn9JFDqfMFWvIpGLSFWSddxNFa3lSUrc+EfLLrqUYQzH4q2fDhJ+I3
         ntcqobSF4EAk0qMQbaKDoypa1G8HVWRFuu9PHc5VQjdm92WVK1sL/9PbCIfGUzZlUGog
         xlBI0gSNvYjn6WeNWPVYm1PJPaPzsegvmZxbHOB0f933EYkWAPWkkYbVgbpPorOjvi0R
         fFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942881; x=1789547681;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4SlGIdM3cTMUMV+JFnfbpS9d9pPhphCilaasH/UUBmk=;
        b=OmADsA8SFbysmybmjhQvUJn5dpxhBIMd1rB/cLkUvu1gNhMP5JHu7TFY1nxrjU1RXY
         2XoOXZJK2A1wYfUaQkxYT3jFWdVCOfe7eqwRFuLkXB61rtxMajMw7g00d7dFxJ6cv52W
         33dz/kqlhxKQB8EA4zq+8vyUFD3hAKohCBZbWkCpSz+SdV2kj33nqWTv16AGbXhZmCF2
         +vu4LHEI+c6wgHpQYAYtyp9jAp7hGNP9LFHlQ9XzuIZdrdAEc450iFts7d9k9CrCQ0iN
         JQo/q8jZQmOchfw5dQSi+xrSibSNESHruFOjeZbheqDNoQthgxL0h2ids375ZETemsGa
         Ja/A==
X-Forwarded-Encrypted: i=1; AKwUvBy2/v1mFeW6ubYw9T78U5BpQeFUBcmj625TLjc6IwpdSF1O9ZhTMDwd7H77kML+JqV55nP3CAWQEcuO@vger.kernel.org
X-Gm-Message-State: AFuF++l96+MJldbDoJnzgl3/ih/V86nDyZo/N+Vj78sdB0SNHZwfHydr
	wYesyl7KD0KAkNzo0PpX7dJj5fj/v6EfZSOxgpfnnnD5aUWCmvplol85ePYE2v5tTsgnrFrDr7N
	jso/Fb78+DhQTagHhyNidG6hYP2XmWmKGY9BbPAhEy/Ry2IXHIKKfozOzHdbFokJ7
X-Gm-Gg: AYBFou3XMy0W0US8fRjZI/Mxia54qh3j6QCbX8l37mdW0AlXrRK2CoOlmT0AwvOHEGe
	cwwvc6HF5azJHd2N0R5c3Ei21Y5kgOddYtp2YrcWpcakj3ltK81gujt//HZ26laq5GVO4fuT/4b
	NX51gZzyujbRbpmRYeZyp40V6UdHSt32LMYtc5P9OcmtqCselJzflWIBFnPc7zDJSIjwCcWAGAm
	79jiviRmRtbDRnxUDhDwmMGd96BO3wuI/mI4GRrR8IPLTQjN3LrQbB/ioVUOouiVdL07CLg1z0q
	S96iUcssf6zpDFBd8Xbr3YIzAqYTxkd/e4wnvgdNROBUcYxUHEzRevf9s+gUP6HjMzgR8pZ6zGr
	Lig2JvAOeGYc2jsy4QkQZOGw45smGIuLN34YcoTHh5lA=
X-Received: by 2002:a17:902:c1d4:b0:2d8:d4d0:792e with SMTP id d9443c01a7336-2db128816cdmr310682865ad.18.1788942881110;
        Wed, 09 Sep 2026 01:34:41 -0700 (PDT)
X-Received: by 2002:a17:902:c1d4:b0:2d8:d4d0:792e with SMTP id d9443c01a7336-2db128816cdmr310682355ad.18.1788942880587;
        Wed, 09 Sep 2026 01:34:40 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm47133770eec.30.2026.09.09.01.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:34:40 -0700 (PDT)
Date: Wed, 9 Sep 2026 16:34:34 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] clk: qcom: Add Nord DPRX clock controller support
Message-ID: <aqEaGuCwBRnld3db@QCOM-aGQu4IUr3Y>
References: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
X-Proofpoint-GUID: Rj2yBU0_OJZsC13M7Vn4P1gG-okBArvO
X-Proofpoint-ORIG-GUID: Rj2yBU0_OJZsC13M7Vn4P1gG-okBArvO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA5NCBTYWx0ZWRfXxhKYdcVd2Hsp
 AR4PgywLTaj0wHbLOyybbXIBLyHxy+SC9cLj700V6gDbbLWcmTwSFKpfrSDk+TOaBYwWnmnLc6Y
 Jhs0GvQNzEoCxQBuawNVnP2X1pJMJHFzyNnQn3cKczKn7327oVDgBVIFt/N6WGT3FymTzgnSBUo
 NOlpJNsoulk6iPxsA9uzezOWr+pm9ocE+LPlN4WzJsZphhVo4lcwZ/R4RNmWU5YdH995vkf75XR
 XoWJ889ToDLsRhxZlEevMy5kpbzFYdoT9duAebeDsWDTDAB6njx+PNCVsEPgsYqfKC+ibpsy6mC
 Opvg5mJbGp9E2U8x06Sxv4fYtet26hvRtD/GKaueG+QszqV+DlWwO79kpfJ9TpK4BeDOrR4a2Nb
 T+tkUX4pcuLP6O4Y8l1gAekcUll8868moSsYkx3VlaTHtwSTkNCw/QiNE2SARQZI8/XAmLb6O6d
 zNov1v7/TqzCxDIAPkQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA5NCBTYWx0ZWRfX5OIWc1WndCNB
 JWS3TE4/OtuvOUp6EXXKXbcPMOJ2tMy14rz52LSG+xniWi3STC0lITkluudtjGn3yZrMOPt5+l9
 vVOpQVDwZIGmLce7XJzvsYoZUWkj1CU=
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=6aa11a21 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=IoEm9MQS1YtAEnOBX-UA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090094

On Mon, Sep 07, 2026 at 01:56:12PM +0530, Taniya Das wrote:
> Add support for the DisplayPort Receiver (DPRX) clock controllers found
> on Qualcomm Nord devices. There are two identical DPRX clock controller
> instances (DPRX0 and DPRX1), each providing clocks for the DPRX core,
> audio, AHB and video memory paths, along with their core PLLs.
> 
> The DPRX PLLs are ZONDA_OLE instances whose PLL_ALPHA_VAL register has
> been widened to 28 bits to carry the fractional word at a finer
> resolution. The existing alpha-PLL core derives the ALPHA_VAL width
> solely from the register-map layout and can only express 16 or 40 bits,
> so the first patch adds an optional per-PLL alpha_width override that,
> when set, feeds the recalc_rate/round_rate scaling and the Zonda
> set_rate L-adjust MSB check. This is a prerequisite for the DPRX PLLs to
> lock to and report the correct rate.
> 
> The series is organised as follows:
> 
>   - Patch 1 - alpha-PLL 28-bit ALPHA_VAL width.
>   - Patch 2 - documents the Nord DPRX clock controller device tree
>     bindings.
>   - Patch 3 - adds the two DPRX clock controller drivers.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
> Taniya Das (3):
>       clk: qcom: clk-alpha-pll: support a 28-bit ALPHA_VAL width
>       dt-bindings: clock: qcom: document the Nord DPRX Clock Controller
>       clk: qcom: dprxcc: Add Nord DPRX clock controller support

Hi Taniya,

May I ask to be copied on all Nord patches? Thanks!

Shawn
