Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A7B23ED60
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 00:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790381921; cv=none; b=ARQ0XfcHm1HPYGAbLi3S1Nuh4DXk2e0FKjjaZ4ND5748r5F9Vmy+uFrMqJgCneJEZBcjxYjTxQFb2Z2rcdtgWGV0OC7ENNPR1YgFvXaNr+Zfha7A0n4773CJWZsiqYhCAzA71PZdQij+MAYhir7/qdwZmrvxMdfnGRTPeAvy8zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790381921; c=relaxed/simple;
	bh=VMH0mqnfAjpj745TSAU4jjYfnm19/jeV8l68qOpJ5oo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EoTTw6rzFf0bsSkFKsus0x4ULkdNDvRZCTRVhA51huWnSRDo09b0aiQeR8fxaBqTo7/xR4/Mg8oxDBejOmla0gpzohT/9JfmQEGojsxyi6FKdf0gvekJ6WQ9tefNXkRGE6dewdPoSJ0jQuI1/xy855MFiF6PAUmR0cD0Kbux+u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p4Hmps4j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RQeNK50C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p4Hmps4j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RQeNK50C"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PNbqCu2931604
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 00:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PLHqighbw75XO+o+nLzJ9wS8
	/3X1F2owG1+Hq4/kqUs=; b=p4Hmps4jrZ8v8NOnHAtjkQGpaTWCzo/gba9lsiI1
	sfiUt9MsDzs8qsTVX/9wzuJbPB95+NQ9twQkQLlU6rhNXNh/wf/fpT+wycM937vH
	U4GO8A8c/awXNnYuofz2626/q114zkGeolI/4Lv2EuFVSEUufh0wc83JrYaG0lTd
	PiYc1qnPYLk8P534hrwmQ3yeF1iDG6KS5dAswzLXjFL/v5Dh4iGW3qev2LOGclTB
	lFq6jpCIVvD/k6aks2YPoc4Rk8s7qbErzSb5bUlmLGcBEAusC51RbLmsHNj1TwgI
	n8Fzleox9kfudKZucVdb3KF6azN9V2TubftgxLM9vZA55A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwvw1haq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 00:18:38 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3286d2bac04so2016406eec.0
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 17:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790381917; x=1790986717; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PLHqighbw75XO+o+nLzJ9wS8/3X1F2owG1+Hq4/kqUs=;
        b=RQeNK50CkDauzspCqUMCMNkp4i0xHUj8d4g5F37EX3hsbNnIrk7jYJDmmpiF51vZJS
         OAUXhqN9JzPR4OJPc/SaXYSahlxKQlUWbye1sM5cL/wX/ZjsE+89XW2h8RFAckqsi7ZS
         Eyj+vrg4C9ZM5G7/4Zbu08/qE7KhQDIzfAc9hKhoSaULC5dphpHNPxqh11j+xlmcRXbd
         uPdpfZ+I7ql+veh89dTcHp0N1US7UTx/ofHp80PrKNEq0dv6TaCV67r63V5hzFQg+ygk
         0AxcXD7UUtW8G8LLodL3YQLmmprRF6msomOjHcmAXELyaf20ZK44ME/jkjmWackJH4Du
         +nuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790381917; x=1790986717;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PLHqighbw75XO+o+nLzJ9wS8/3X1F2owG1+Hq4/kqUs=;
        b=xSogiKy1tJqesvqNlfi40H10NtxfWMNnKBGCxeMDscMwXR1D/6GleOj8gmAaeUix6Y
         e9FF08YpaZBpercfZfwZuiU9coIwRuicRff8Pbz6eKek7r4ZsTGVE90EEKMl0eLiMhK+
         bKDwzIhUvl50LG4V0rixXTWdr4SiTetAH6cZNoqVAmFDvqvUZ3zP24pp4HBNiAtdEQC6
         aP4vgtZiV6nQ/+UWn+Xp15WoYbWDyFbvxMiH0wss+UEhzt/YI5gtRdbW7KRF3d3YsVT/
         zPJlWi8dJoerCMLooByGBO87giijwkDozaOLmKmscxb9iu3pCQ/sMrptqn9//xmJTkB0
         UNDA==
X-Forwarded-Encrypted: i=1; AKwUvBx45tTaSH32B2IzQS42M4NUuR/wYiFik0448/RDCqb01L3MZXQNY0xnhLH1rUSCzXWLzZW5FOApGdJB@vger.kernel.org
X-Gm-Message-State: AFuF++mPoeseceqqYWtTWe0LpCMXwMbijy0aFSrvsO3U9mvceSNb3V5z
	EFVywmwXM+RPmobO4iL0L/UIrPGdyC630exA+VtV2vlBTpff/m0wDBN4y5FAHW5O0caU2CoYYXY
	1EecvMXhHIfx8nuHOGiOn/4Xhk6O99ONj8aNuxEpcLNmNgXPHO3zUGDouhiF+6eHU
X-Gm-Gg: AYBFou2kWKDICoSGwapt52puAn51moLpYN/Eoy2z8gbX4vnP2TDETn4xDNG+xFr3Ui8
	k/LfKzoniojOSAej7umMF0koRAbkhwk9Jc17wL89ghcujRxE/ITWPOtqrJF643qUjeCdbtMKtoC
	c9pz4kK9Vo4SNe/S1MmIzT+9ND6cfDncqXkDegaYgQ0xLCNsaqdBieswfJ6MtUXoKkVXC5/JZyW
	aW5bM7Zy+C9AotwQEwkv6rgiQePboeE1HYfbdJTdOg/tS+OqczJjgrYMOT2JLDTCzpphsSX9qyg
	zLU2h2LG7kAZWKTvr8qdevPbru4IjrUio5qamNJfmaF2SlAMR8u6Vcs00dZgnfZUIdLa9OF03Zp
	y4KL6Iw8YK72WA/sWfLB2PNthuH79oXWckiSwkaz9eQ==
X-Received: by 2002:a05:701b:2612:b0:145:4ef:e905 with SMTP id a92af1059eb24-146d096bfb9mr1141132c88.42.1790381916806;
        Fri, 25 Sep 2026 17:18:36 -0700 (PDT)
X-Received: by 2002:a05:701b:2612:b0:145:4ef:e905 with SMTP id a92af1059eb24-146d096bfb9mr1141114c88.42.1790381916202;
        Fri, 25 Sep 2026 17:18:36 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ac67c505sm7988612c88.5.2026.09.25.17.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 17:18:35 -0700 (PDT)
Date: Sat, 26 Sep 2026 08:18:29 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: glymur: Add videocc sleep clock
Message-ID: <arcPVcaWqnX-tG6O@QCOM-aGQu4IUr3Y>
References: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
 <20260924161152.1162301-3-shengchao.guo@oss.qualcomm.com>
 <0e80efa9-9377-474e-99f5-d458d81bfcde@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e80efa9-9377-474e-99f5-d458d81bfcde@oss.qualcomm.com>
X-Proofpoint-GUID: kjmQ7F23lT3Alu62dCZ8FS5Yg9xxtPJ6
X-Authority-Analysis: v=2.4 cv=YqCa1IYX c=1 sm=1 tr=0 ts=6ab70f5e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=ztxlnROUaC2VjM3YxSgA:9 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: kjmQ7F23lT3Alu62dCZ8FS5Yg9xxtPJ6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDAwMCBTYWx0ZWRfX3XZ5u95eGlfq
 L3e/6hilkgyNjz0B6NeiW11s9k6swK1reZBYo1iFyo2nkLeuHrr65PlvTYhnwSEO59R+LC/P0MS
 d8fTbkdmRrAiusH9kPAJDyVcLon6eDERdI38QUSyKeOgxKhUp/TmH/st7oUNrObGlFDgGEWC6Hb
 hpQRky59dcufwSVFEvQf//1c4m86d9M7oa+X5pBTJiXZRDc7QiEhcS9xY/jy6A7GkZAFvXHRA3K
 arwKOCCotIxDW5SqrSBAj2T+pNuydN7wacUk9uHL0MPvrL5t5uLJts38293VNIyUeubz78IkPK/
 /FuUX82FG3D8eJfctc6EaJo0J7zhTuYEAeaF3E/1JrKEFXuZu4EpWj2HnFhXfkg6cs0fFgG9n93
 rpY8SEdbwhOfIv93yALjEjs7Fex0nXNvipdrUl3WPmcwT7ECUnnBbeTqB3buiJuk22MJW7sjE9B
 AGnOxlmHn6mde/PRgMw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDAwMCBTYWx0ZWRfXyRUrwLQb4eNI
 vmbOayun8SedN/ZNYcw3wV68R76Lph+zGH7BJvXG4fSZaQH33Zdiqjuv5InkJEQJi7sntLBQiSQ
 zZtk0L5MiIdZvqpYoU0EeYbrpu4hX2M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260000

On Fri, Sep 25, 2026 at 09:19:49PM +0530, Jagadeesh Kona wrote:
> 
> On 9/24/2026 9:41 PM, Shawn Guo wrote:
> > The videocc node supplies only the two XO inputs. videocc-glymur.c
> > expects a third input, DT_SLEEP_CLK, and uses it as the parent of
> > video_cc_sleep_clk_src, so that RCG cannot resolve its parent and ends
> > up as an orphan clock: any clk_set_rate() on it fails, and it shows up
> > parentless in /sys/kernel/debug/clk/clk_summary.
> > 
> > Nothing is broken at runtime today because VIDEO_CC_SLEEP_CLK (0x8138)
> > is listed in video_cc_glymur_critical_cbcrs and is therefore force
> > enabled through regmap, bypassing the clock framework; the sleep source
> > simply keeps whatever rate the bootloader left. The orphan still blocks
> > any future rate management of the video sleep path.
> > 
> 
> Hi Shawn,
> 
> The sleep clock supports only a fixed 32KHz frequency and does not support
> any other frequencies. Additionally, this clock is not currently used or voted
> on by any consumers. Therefore, leaving it in its default bootloader configured
> rate should be sufficient, and this change isn't really required.

Hi Jagadeesh,

Agreed on both facts, and the commit message says as much: nothing is
broken at runtime and there is no rate to manage.  The patch is not
about fixing a functional failure though, it is about the DT describing
the hardware inputs the block actually has.

video_cc_sleep_clk_src's parent_map contains P_SLEEP_CLK and its
freq_tbl has F(32000, P_SLEEP_CLK, 1, 0, 0), so the RCG really does
take a sleep clock input in hardware, and videocc-glymur.c asks the DT
for it via DT_SLEEP_CLK.  A DT that stops at two inputs leaves that
input undescribed regardless of whether anyone votes on it today.

It also matters for the binding.  The schema currently documents two
inputs for every compatible, which is wrong for qcom,glymur-videocc,
and I am fixing that in the preceding patch of this series.  If the
DTS keeps only two entries it no longer matches its own binding.

Shawn
