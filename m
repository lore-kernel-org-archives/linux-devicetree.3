Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB327192D97
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 03:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780887922; cv=none; b=Vx3tau6K+tZ8qnHrqCT42alWKcgqF+BSGWrnIn4F4InZnX7qyeXbx5OEH7DJ4CCcO85u47BxB0rk21GG7lxULn1FN2vZ2pjHATbT1JMcV54j9ccjfTUbKJJLZd/BkEG1pt4byx7QMZuebmMR7Cm6LSU92dgd85WR9svlLgqcE5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780887922; c=relaxed/simple;
	bh=ZzO+xkhtMNBw34NZJknOUCTuwjS4aaa3c56ReHvEvpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oAl4bc6fK2u9teDV00tuKoqgU3E2bLsIY7TookftQm7HgfUDSzykygUKyNYeKb8Fg2tYqj5tC8zAXAsVvMCC646vpYL4w+TStGffgJLHc3aiXFXfcT4rLfEJKFvvOvAYjXXc8JnRSPxYhfGKYGMgut6OnXxYO3QRfnZJRGyqXlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GQ6dpV86; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RmtkK2tI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GQ6dpV86";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RmtkK2tI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580HNpS1935309
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 03:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u6fRuSMi07wfs/X3hr8ERNVY
	8T5EEOC3T+9jm25RzpU=; b=GQ6dpV86/pJhcn7NpdSOIJoNuoltluceU51eZ0Ae
	RvZAfnNHBx0rm18CW+smYpfsfEjksURe+mleDAb2k99IpeHdU2hoR2M3iQr5/smb
	/mIYzuKdMpX7Ch5dRTaIHDoUZAOtIlJF/1MLJ8Q9YneV/R9+AcLMrnx4GfknKwug
	ujuhUMTBNa8mKUtDFl9vET8Eb+S5ZLy/lp6ESYsgvselHuC0HVuTlDqA2W5ci/sa
	ji5wLCQaKG0DIW9hzxptjylAcAhTya2seGlNuQDZ2padE88JBJXAZwemEkd7/yQ0
	waagx2MC4zOf3f8yPMWdVjGLB2yzp/vZFs5nZUIEZHKmGg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf5pfw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 03:05:20 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-963b099b539so6024269241.0
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 20:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780887920; x=1781492720; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u6fRuSMi07wfs/X3hr8ERNVY8T5EEOC3T+9jm25RzpU=;
        b=RmtkK2tIoICZDU11s2uk/zAJN8xpnkobH+IjmSgsP2JEGp0v1N+jlIz6vvdF6RQ6+g
         zmcQrBAQdrRL5tbOp67iVCtxmp08OqYfu7WoL2qsQDeS9R1uzFcbAYpfy6OcurtLrUhs
         bEj4s9LnOeB4eqaq9yY5/99IMIoFXIHduOatTQqt0KkS9XrO9sMsdJg4b5SAEdZ9YQLX
         jBKqljaeRZafEBQIZd7B5Q+WRhOCskbc19DNaxHkQj47KIXk/BE9jKbsB3wsmjB0/n1v
         /wAw+JEdBlIT0nsaqwRNW2UuwgdSbQplBTjbx0AhwzOeuWl68DtIbsuBRaAyb0/UpnZS
         Pzgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780887920; x=1781492720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u6fRuSMi07wfs/X3hr8ERNVY8T5EEOC3T+9jm25RzpU=;
        b=XKcmTAI+v0g+3zlk7O0GRVmgdvQfRZO7cEnVR9Inw2uyZp41cSXgrIpOnFRTd74x9/
         l3HGIekI2hQmJru3bhUpIVURMCVZo720ndKyn+CFHftv1k5Mn12pdYy6xyAYQWKh0cVP
         vgfUoPkLLL1Ngvpz0YtO4ghkfdz3gwKeryvhu3y45haM26jczGQbznXsgrzAwSuvCZRY
         iayXS6dFjV+HNB3VRfD6xUKjEWF7gInMM+4126XsmXORz/uAOd+kvRN8VtILXMtlglyN
         Zbhezz3g68oYfCSJBhhFfU0t9P8MlB0In7K3m/GTQZ6uhnBNHGx4lfFl0TMND38SkIKh
         Uzsg==
X-Forwarded-Encrypted: i=1; AFNElJ93gVRMKmy3c5qqkDSR3rchTMnx90pOE5i0hDP+FDTbSH8rTu9mC4eDMpXjEyae3mWTiaIF/CCrJYjR@vger.kernel.org
X-Gm-Message-State: AOJu0YycSStKMcgyoxkRwESJ20IYK56v26j0ueb9OhbIkITHIc3XFLHT
	2XouTQSzvzjVGrMeZP/uFU75Ln9aMPw8Nfpp3snq1zkfaQqE7YfSHFWTGoBY4yrA4lLu/XQwdWl
	aDbtNZHSbLUdRUVP7xY69CfK55UuCUULoX+krgB8rQz7qPN2rIgVM8WZ75SQVVfMT
X-Gm-Gg: Acq92OERvph8Wrn7p9UGXLWSf4J66isgQDG6XXPSIO4vKCrmIKD9j5e/tcZfGCXXCxt
	Dr5O3BVyaUPD5GOuJr87/MMClBxAi6v3mENibkzZt7tfPVE6VWD/fqXrOWKyMoMjSXh3MuaoL8u
	gMUhlcX34/u7zQeoOhR7ssEmr4FLZxDAn3YLJVrxE9ORzz/h04plqM79stCF7+OSGiWNxHq6oaR
	1nXmwXmXiHimVnFvRqHxvV8E3ko1EWCked3GDNjEpYuL28VHM1w+I/8jj1elaOKfUyqCn1Lqc1y
	vJSyzQ6l7m0Zb12VhdyjaZTM238Vl/RO6045Vha3I7byNb7wyM1YRNpc0kIIICsdoyC0N6Py/2/
	v4+2rp0suyM9YtDoJgEOpgFPcozNuKovhyAkDv00xryXQKruS/u5ovyPZwCblutOUSiQkyTeDiG
	cYbnj+hqrCRJQwTOrycnIJeTUiBF75seRgacWuy9dcqFI/Sw==
X-Received: by 2002:a67:ff0a:0:b0:6ca:4d17:99f1 with SMTP id ada2fe7eead31-700359f5a98mr3362636137.12.1780887920113;
        Sun, 07 Jun 2026 20:05:20 -0700 (PDT)
X-Received: by 2002:a67:ff0a:0:b0:6ca:4d17:99f1 with SMTP id ada2fe7eead31-700359f5a98mr3362624137.12.1780887919706;
        Sun, 07 Jun 2026 20:05:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b990344sm3450395e87.65.2026.06.07.20.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 20:05:18 -0700 (PDT)
Date: Mon, 8 Jun 2026 06:05:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: add lcc-msm8660 LPASS
 clock IDs
Message-ID: <3zfrwk7msdfum7kmmao4szpie3gtcirp44kjlpcweik4tnfjai@tl6n5fvxircs>
References: <cover.1780148149.git.github.com@herrie.org>
 <942e4109a23de49ebd660272b9c6a5ac1677637f.1780148149.git.github.com@herrie.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <942e4109a23de49ebd660272b9c6a5ac1677637f.1780148149.git.github.com@herrie.org>
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a263170 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=cTwmTnRGAAAA:8
 a=PfdHpp1dQluSkMl_sowA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-ORIG-GUID: O8EC7UcwcOR67xMC82i1xndNWMAFsqa9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAyNCBTYWx0ZWRfX2eeb+WrAyjLK
 n+fEG8/FQKLMjHfqKjwU8pBRAmNW2V7Ae7MGoIH8WeIrBr8uN3zKqoVmxbPYyayK22L865OrYBL
 QnIHiQ5rwXfYEEDAQcGjI4A/IYiPVRHhVZL0L5Ut4kNWvURcpd1Ik337nTtfjeFEmW5u1ykDS/p
 etcMLRGTgt550toCS/ufIu57teLCMs6NVgzf/QoFRqhiZJjx/IDWN5jR+RG1C8ff7PZnqK/N/x+
 QGw7nwTdDtgiIHxXazs2gBRYhYiRjgR2ch5OuSOm3iVYqhGvcg0m45JT0sVgIbM8H2DZ50GpqPB
 dfnFlsABGqd/1Efj0FLSFAz5rMYSTkn0TiguVWxjqjqLGGzxto7IJhnIKpRaOmr8b7q0ryaPQOP
 nvJtC7+4gpTXfSO57lcIyHmMjZPNqfPEVLY3zKQidLvdE8Kg+oZTeZQ+ZJzhiyEnN27D5736gxM
 /KqTCQXkBjP264BEmCQ==
X-Proofpoint-GUID: O8EC7UcwcOR67xMC82i1xndNWMAFsqa9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080024

On Sat, May 30, 2026 at 03:59:57PM +0200, Herman van Hazendonk wrote:
> Add the dt-binding clock-ID header for the MSM8x60 family
> (MSM8260/MSM8660/APQ8060) Low Power Audio SubSystem Clock Controller
> (LCC). The header enumerates the LPASS clocks consumed by the
> qcom,apq8060-lpaif sound card and the codec/AIF nodes downstream of
> it. It mirrors the format and ID range of the existing LCC headers
> for newer Qualcomm SoCs (lcc-msm8960, lcc-msm8974) so the
> drivers/clk/qcom/lcc-msm8660.c driver can be hooked up the same way
> once it lands.
> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
>  include/dt-bindings/clock/qcom,lcc-msm8660.h | 48 ++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,lcc-msm8660.h

Full bindings, please. You can extend the existing qcom,lcc.yaml, but
the compatible should be defined and constrained.


-- 
With best wishes
Dmitry
