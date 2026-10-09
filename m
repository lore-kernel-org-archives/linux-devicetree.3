Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170B3382385
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 19:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791572863; cv=none; b=F+lfBBhHouruAgnJ3FlL4y3uEYC9fvh35dcVu8aKSPGbFNPFQI7TINA/150qXFGhSMPWqKkBtcUy+sdr/2OqTfHee56/LW0YMuMFJGUuIpVQqS4eZRTmP+tIQ0Q2ntFOHs41XfoBaDpdxHKFRTdbPqt2uD50h0MCdYksBcBsaCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791572863; c=relaxed/simple;
	bh=NUU/Ab+Zrm1E2zysy9bbgOAmEA6PP88zabVf0y7lA7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MJq8ylt2CBaMBRmq8a2CZq+o8Xp9uJiuFx2PHfpeHoWKrRl4yDo2wj9xbX+YeLbW7trAPqoVHfmu1HQbxMl3+BMUXeJOeDJbJWu98+udxrhj/zeZ03X2qZV5JH+1AG0LyzV6BQ5jUoIk5JEEv5xnWR5Se8ILuJccIkeKQKlbDiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oOURCnvk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Op6JGj0w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oOURCnvk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Op6JGj0w"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699Hfmbq2881988
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 19:07:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=D4eG9FwHyQFv9GDgn+cGvZR8
	MKJ2fMxH9Tvyu7jW1Mk=; b=oOURCnvkAp/gI8i6J9LIF7KLI4nLfiEO+DY2Mi4d
	uFdBr019A2pMEl8mX0AtncolezHdo3iHEkb2Sfcq0TZUHB078EYmngIwPjI/gedT
	eXtmf70oekPbCLEJj99p8ggncws3NEPQgQ4fY4LbXqVTSiQY03+5xmUAAqeQa75k
	Y9ql8UuJNpu2HdN5dRXJCu5JGRWdhtSoptY5+mD2Nfebqfmkc/ERtbkN3NT6teAW
	Wafrm32CVIu17Lw//HNZNYNNaYw6tZiMNy5hMAEbTrlwsihfJBfSlGR2kxywbNJs
	f5C2YqYg6L6PdzO4uN/HpRzd73pQUxGwM0gx0GcBn2/GZQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t7gcw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 19:07:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93dea1b6c89so1242964785a.2
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 12:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791572860; x=1792177660; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D4eG9FwHyQFv9GDgn+cGvZR8MKJ2fMxH9Tvyu7jW1Mk=;
        b=Op6JGj0w09yYbqeHhyJwlZqUWh2tz99AN5mg4toZn8qJCqTmHTKlh9AxmHnLWYuEDA
         gOeekVS74BTNEPzIKyKB8Tsc/HsLDA/l8z3eyGLLDqoyV3noFB3pCfZtsD/VsNX1O2+h
         CWk/m1fnsCRLmvsAwhoi7+go/sychvwZcvMeIBaoe4Qti7LCkn2ETNBHOqoaEorbmqrQ
         U23UHGNDmPR5ZbMMDwg2UBNtYLFIf40fzjBfEsU/87o6/SViONcsW5f/mMErCDGUa7aF
         t7gsyjNDOlwEoLT5dzJl1hHNDu1fpuUbAtfAYfmBKwxKa+aiIfxBMBdTLoRhZuKJZ0WP
         U9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791572860; x=1792177660;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D4eG9FwHyQFv9GDgn+cGvZR8MKJ2fMxH9Tvyu7jW1Mk=;
        b=oXsrL7ysBwWIfqLJ1K2PFI12LlEr3bua3l2GAxejI2vgI0wszbfG3PaOaEIQcS8rdy
         E44c5Z5+TMyAl8dgpToMpIsX66t9ReyfU0UrFDTFq3e6nL5S7XQFFDP5/yXMfBPnDtQS
         XFX6A2VMAmVZKeo+pDjNOJ7PHCFzjB7TAc49hq9IsVS6RjQUSu07Gxs/fmrIp1vzWbXF
         fzXedOWK4347TGEHIWUbqORU/Rp7mLSNUcYtLSr/w+QTh2n26IpXJlDYBzP1eN8nhz03
         WRjgjbP9nR8NnIh4+MxUd2Gzf06PVKe3AbC8FxiUP+cVB6odhp+s8u2KcHWNWLpXoyWX
         gmDA==
X-Forwarded-Encrypted: i=1; AKwUvByV5GLfw3iOz3kPGuxQ53m/mLCX7NUZEaNZk8uLBL6QfsgJ0b8hbTpFVK7Od9wvWa4v2FCIvD6NRJ9c@vger.kernel.org
X-Gm-Message-State: AFuF++l01UZDvYQk6ksVqtwzQwQCsY5zR9Tgubb0vdPRepQE36pel5OX
	swnwcWn4YN3xh+1v2XX9pw4BqztliUiO8ssTibk4Ky4CaBx1A5feMkQg55FKBgrhuPBopgH8nE2
	dpR6/tlnA9maobM0ty5Laj0ruMeVye8y+tJSeOyHGtPs7+Ig4wO3UdUibEdOAxvQ8
X-Gm-Gg: AYBFou22PFs+CsrqAPUUKugurcq4x4hEdvHdGuJJN8RwHMbosWRnbEezfaFzaEfp86G
	Kc9ScqezFF+ICu/hxra0c+XvJsx7Kw7q04VzWFp9EmpFkrf7EQ5RwFNFxQVvEejX+8Ogo/kCgWK
	XSgtB3a/o1aRCQb2xeSZ1uKr9zClCbJEE9IMVgc7qHhx1n0cPDDB/G68QrmjMfWN+8MUaUdrUtn
	Cj5LoQkrhsFufdY8Zudn5O6C4HOhKFHNEv8l4m+eW78Vd0LAFGzSKfFljmRkHqjKvJ4ebonW45+
	9+B2kT0KvIZTR3f44ldewoKwTdsx1RI116KVExwOPWn0joJKnHHI+kbqTKNs9cJ8X+3NSzpyCII
	oq0cANYpjC7AVRdk=
X-Received: by 2002:a05:620a:17a9:b0:93c:ba2a:6c1a with SMTP id af79cd13be357-93ebd271e32mr451542585a.61.1791572860081;
        Fri, 09 Oct 2026 12:07:40 -0700 (PDT)
X-Received: by 2002:a05:620a:17a9:b0:93c:ba2a:6c1a with SMTP id af79cd13be357-93ebd271e32mr451536285a.61.1791572859484;
        Fri, 09 Oct 2026 12:07:39 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be97d1esm114363625e9.8.2026.10.09.12.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 12:07:37 -0700 (PDT)
Date: Fri, 9 Oct 2026 22:07:36 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: nord: Fix videocc clock inputs
Message-ID: <gp2xdq5eysazqsj62zbhv5rimzfrrd74ttzctojl4ol5oouejb@sesvousgwctu>
References: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
 <20261008081036.3492003-5-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008081036.3492003-5-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=W8atxhWk c=1 sm=1 tr=0 ts=6ac93b7c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Z62H7OANAOBda0uacUIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: gaew3M5gFNwVrtmn39Bd4t2BYBUeQZug
X-Proofpoint-ORIG-GUID: gaew3M5gFNwVrtmn39Bd4t2BYBUeQZug
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA3NiBTYWx0ZWRfX7bA69xk1CZrV
 yjZhk9VJl6BrvnfVxYoIfXN7dTKBYKhlMtA/kESwqt++LzTyQVH+oX2nf21PtToO7DMfTCvERra
 mEkiI33os7MBrH4WnNpnqSi23mjfU5g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA3NiBTYWx0ZWRfX3aAFtDO/K/ao
 LKWtigLzK2juoWSvj1I6ihauwlsQ6qkdA2eDbIXOUehYMm/++IDJtQJD7KhuRvQI+qlmlg0Wqup
 Q0CmjNT7LnTqD0QA1LTcnl4rXw/xWB3gYZcPgDUWly/Og9PB1mcZUZPEV4CsW4fEcQSH6myZayI
 Su1/FUHW8j8l+qpnge5t+AVhVIFpYrqHTetPtzjk/tMUjYNQafixqNmLg/ljTzFT793ooaqpoPC
 Og3Kn6oO00RehxsGSMiDM7NVX2Id15zVPzyrSLOrijF2/LkQbVd0sLV/q2X15nasoQVKekwZGn8
 056rqanZT/H97O0c8yjp+nPp0K72WXGBUfLFjPeubuNSCSwQs4YZFHKlLt+TcOZCEGeGoYJs4Hl
 9qDsc3Vk686/vMlaVqKKDsZp86rX63s1ywauBhya72fW5yVu4XsOdT/TZfM82PmAn160dUDS9ie
 9Lvi1L42RR6uuI9EnDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090076

On 26-10-08 16:10:36, Shawn Guo wrote:
> The video clock controller binding describes three clock inputs for
> Nord: the board XO, the always-on board XO and the 32 kHz sleep clock.
> The videocc node instead passes the board XO and NW_GCC_VIDEO_AHB_CLK,
> which is not an input of the controller.
> 
> Pass bi_tcxo_ao_div2 and the board sleep clock in place of the AHB
> clock. No functional change, NW_GCC_VIDEO_AHB_CLK is kept always on by
> the NW GCC driver.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
