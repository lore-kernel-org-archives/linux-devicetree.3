Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793168511;
	b=GhEMHygZDMVucQFyvn49mi70El8OUPms127+gMfky/x8aqOoXgRjh9IZFjiLlr2mfAtW
	 hBdS0Frvnq89sRKu1jfLteQZpBgtrg1k1EV5hX++XSIS6DbZd9zkcH98E4e/Mo4YsLErN
	 0lD5B3XVSthWFmCN6xbLLhugc/S81OWumiT72KIgI79CPYDGoZ/aF5EJbIv7eg6blmAX5
	 waFGYkcjeG5iEk2A51dhg9Ec3NHfbF+8XbavQJaxHelZKKyfhzzfjZH9/OPmnlHASvQSb
	 RJqwRfeWrTOMxut8U80YZ3cIFbej4RWQaB35W24nDqfGJ8Fj7eqHbfPAFqxTxmGweOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793168511;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sG9Xj1OZVI1nTkH7YcZt+Jc0eaj5QNvufoqH8/wgxTY=;
	b=22vYLadKNpW9Ex8+T7OBuWOk4Rsp7dDQW7uVwKkBBMD7pQXXxJhFIRqyoQepYZD6Y6Fm
	 XefdCcvIPh3Sw8LtSOnTI1VP2JeXen6UnxudDYukr+M7Aw18BLzCZ7jOJjJhxKiXv0L8H
	 80QYG7dH1/l/9MfK1qy47TPQCgxM4sa8/3IL7pTJx/yvoe7lCQ2XiiyECb2bu0J1GJoBg
	 rOiKVuJ9gJnVdyNt/qxNIJHYY593xJ9jbqgdBrNwYAJsHyHtM3d01jzeaTfTjKWObp2nw
	 TSeKrtT5vhCSMUimZjMUroQn9pNzAWpp7eMiFXp3PmZkqztbA360Lq3myEj9U+oGODA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RGRCJdyq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZE2ux5mK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41E5606A31E
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 06:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A41E5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RGRCJdyq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZE2ux5mK
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4PUm91155715
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 06:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sG9Xj1OZVI1nTkH7YcZt+Jc0
	eaj5QNvufoqH8/wgxTY=; b=RGRCJdyqidppeH5y1UWkTK7cqkfH7Ky9Hx/ccd47
	Lnnk/+X89OuXV4QsYlpHNhta9YMeZRyqHzxhYfDOe4sdVNVIKHogj/BD0IBKu49D
	gYK+9K6xQegHz7NBVAQB6Ne4nMd87z/smpPRZ6sr5MASz0pSJY1OUwh03urjLeWX
	LFJOmSc9x31D47tRusH6y392NtJ76nj9OJ0TDd5HRvm0Zi6+fCWZqDOY5keXmQUV
	BoGfUbaS0lUsIGwKKljqKXPwjmQLjAc10Is5OLCjsy7Pe44cjzBwSDMbwLy42s2Q
	qI9/AgiV1vRoWorSAwP6neZNRLg+Jscrta8Rm7PZu+oQfw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk12pt78h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 06:21:49 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-351788121cfso508242eec.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 23:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793168509; x=1793773309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sG9Xj1OZVI1nTkH7YcZt+Jc0eaj5QNvufoqH8/wgxTY=;
        b=ZE2ux5mK8+z5PYn1nhZBhysEmOjrRE06QDGHFZpR4RzKxHFkjMifS9C4TWvcwwBoOC
         vTHgUEwaEKtJGhE2KrLJ7bD8Mn1gguddB5yNST+4l4XHIObcVVg8sR8LRHwAoQxGrXe2
         YOf/utWNelE0iWIMLJwHVD85+7r7KuW2sD5l9CB3xU+C5Is9ERxkK5/iYrHk/DDtBAzG
         xo0TVXopvi7hLtS5EuGgIos5nE2kE2QpP9K77MP9XZA7FdCbKjgPYmQZ3+7Z6zJ4P4e1
         v/lL0dRLNVSG/RqMue9I1IjilL0a4dVNdSvtfMPN1z6G3BzurHLRp5z/jMV55MkwvwHE
         fvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793168509; x=1793773309;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sG9Xj1OZVI1nTkH7YcZt+Jc0eaj5QNvufoqH8/wgxTY=;
        b=FKhhcwKX9dBSjEuJWjXYi5jYbX4oAsFoLMyMuqpZxx0aMsEF/2MBQro7Pn/Ao9bdDN
         Z/8jsF9UPHo1jeX/j1VKK5TMvX05/SJhimoNWW3wc1usJsltM2Ctr/yCgFkITPmpXFpI
         GhiBw2p7a6sEB5o4Xf/gvXHBaKBmGe2e76Q0cXHLTNo4kQjXFphQ/2QjTwc187zGSe06
         vbcwJaNuoToz07EAkfD/Gur7Tih49hYl9lQ1o5cN0lSKNsGxqCO+AWqGaGWNs3hAyRek
         bAGgZ9twjSVQZzmxrPXTkTxBbZGFUwOmycuTQMoWUdt9EEm/g4saTO3rBB8y68l88z5n
         Vs0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxRQX5/r28YL494W9MvjxSdYIZHnIRH+H04PPdcE/1BFEh4t/tzPY1rjflWW3CFjk5Mp1GtRzUlnJkm@vger.kernel.org
X-Gm-Message-State: AFq9FYIg2GtEnBS1DrpRZaDjRfiNS7rjmzcpDo+zGcDuaiWYmbWrqvhv
	DQtO2A9Ma+Oih9LjVrRiWynfvNOQ9/Ww357LVBohN2oUTBDrPkomryyBp/bZI+4h9oPjmlNJHGc
	x84LZL/tGJJLlYVf4RZh3kDdAFvb/bd5FYOc7diPvRIp43Mm/vZ0YhtPhvSZ9y2i/
X-Gm-Gg: AYBFou2MN76aPRzFJQtKw5HfCIazRNCdfHMREnStysi6hlbJm3V1ZfbeRARl9LXSV9r
	rRxdAacDJJXYWZkuk5vhAfZK1w/fpDgbfaOk30r+lcxF9YMDv9KjHEIr6N4aMGQWYiyHwrdC8Mg
	pB6cJpLxmHmdxfw4xkJYNxMN6ArtRqdTMVxHsz1UxP0zNee8qxSCv1iJ4Xt7W9BelQWLQS+SCup
	leuBTV6a1CCyu1jj9szepOhR9C1nP8+R/vT3qL5TMygewEME9cNgWWRdxsN07onUS5jZlYI4mL0
	iSVp1IQ/8yD9nEs0s5cGX9QbxN/lHs2k9XYuApMkDf7xIhS7lt980YO5txyv6TeIx48TCe0iSo+
	bzhhJAesNJ4S77aSpt0inn0amrZcLGxom3yxWcfwshaZDJrpVV8p1ZaTXWQZbNJaAv3pNcNKn6E
	8XrHeiBQ==
X-Received: by 2002:a05:7301:fc01:b0:369:fa8b:d725 with SMTP id 5a478bee46e88-36a204a51c8mr2161088eec.35.1793168508969;
        Tue, 27 Oct 2026 23:21:48 -0700 (PDT)
X-Received: by 2002:a05:7301:fc01:b0:369:fa8b:d725 with SMTP id 5a478bee46e88-36a204a51c8mr2161055eec.35.1793168508453;
        Tue, 27 Oct 2026 23:21:48 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23641e78sm3397103eec.0.2026.10.27.23.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 23:21:47 -0700 (PDT)
Date: Wed, 28 Oct 2026 11:51:40 +0530
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com
Subject: Re: [PATCH 5/6] arm64: defconfig: Enable PWM_CLK for backlight PWM
 support
Message-ID: <auGUdP/IZnAEui89@hu-anantiwa-hyd.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
 <20261021-lyra-display-upstream-post-v1-5-585caa39cd7c@oss.qualcomm.com>
 <fa143c9a-722a-402e-84fa-a127494b3f5c@kernel.org>
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
In-Reply-To: <fa143c9a-722a-402e-84fa-a127494b3f5c@kernel.org>
X-Proofpoint-ORIG-GUID: bGRUcAflWOvOa7Ht9nX7K4BLMfs2eiRj
X-Authority-Analysis: v=2.4 cv=DtDDa2/+ c=1 sm=1 tr=0 ts=6ae1947d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=eYwbJGcMLBrUiUMk08gA:9 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAyNSBTYWx0ZWRfX7kXVgrQWom9o
 NpmbcRLyxFooVS9IT4LK/73kHMwOAKReUCQIjOV7XS7ECKaoCMuarrq/OLKaXIf38IQWDoPuFp8
 4SyVRjYmjxxO5TmdkDpLTNw9sp3KkT+jk0+dqZca+025ruqYEZtNJPbiQpYwV+RVACJbR4vx7Iz
 utv2o4alamEYPluo+FNSfWyKsEpl+aJKo6ZYVqJeNONcSpHv0VvGzScVoMzIZJKAHdnnYllIrmg
 mayXFX1OUZ+Gkbptmd8n0JTru6pLAwQ+PVZuiDUzp60xM9QkSz6fmpm6NvlgMmrG2zRZ/p91buG
 MnOZNyDFrqHbXGssqGIrBq4hgqZiXQUtPC4XYyX3Z41QMk2D2LED1Ed6m+N7qrjetAPhHEmRe4N
 w6UGC884/8ch8KhfaQ64u6Evtl5g5wqpmVr2+8+AFQnhloYVa07k3LM4HRpybRyGr4E5EePsswF
 YSlNtdf2snKg00B1W6w==
X-Proofpoint-GUID: bGRUcAflWOvOa7Ht9nX7K4BLMfs2eiRj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAyNSBTYWx0ZWRfXxwjpYUsp8IV+
 q5uGtjfsBy4OYXF0vLYwDfbCZ2StT3Sqvl7KegQDlmc+A9E1zvZdOSkVmXUT0fzDO3OSkXk+PwV
 0VZST/pySrDD1+gklGxlekWB44uJSEc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280025

On Thu, Oct 22, 2026 at 12:48:05PM +0200, Krzysztof Kozlowski wrote:
> On 21/10/2026 17:17, Anand Tiwari wrote:
> > Enable CONFIG_PWM_CLK so the generic clock-based PWM driver is
> > available, used by the Talos Lyra EVK LVDS panel overlay backlight.
> 
> We do not have Talos vendor, you sure you did not miss dependencies?
> 
> Best regards,
> Krzysztof

Qualcomm is the vendor. I'll update the commit message in the next 
revision.
