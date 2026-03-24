Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5073090D5
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 22:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774391264; cv=none; b=dNZO3wnLGKzAABaACjIGuqAUYK8fOzTKLk80DlqzyKilCCPIQeqVB+YE+RIzOESwrXPRfcZMu7RgVqIJsqeISSrzmMPcJ8Jo3kL/A3iTp//XzLPM9z7jTvTJDR3NKo01Yplu/j0QtWvInNBJB3xz/GA2WHRlwPUiUmJw12mFhOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774391264; c=relaxed/simple;
	bh=VFrxFapZMWo+gW+1Bag/0WEOBQGzOBp8zh1WJOANLsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tnpN9YJRMQlozUcE3C5+VnLE6bvZrNoT2d7ldAvcA5ugGQu8AIdQ13dJgeja97lLaX9BytNiOMvqPfdjMXduk+67KQQZtMlyf9LL8a1jpH7UmgSUimnQmGWRFap5cbohYAXCn1VETza8WlOJ+WMmDr/bp8NoziLrCyPId775FQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XzOt7dSz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MZAiO6Zh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XzOt7dSz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MZAiO6Zh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCrPC3110448
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 22:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d7o659NDRbqQiwXVOjyovY3N
	0yKj36qT/352Z2Pb2RY=; b=XzOt7dSzoi2FERhzkAKrsxXnsr/IqLO4x/5ib5ZD
	7UJDZErlvOhh4vrm8+YC34DW9icPK1XOBdrb3Scj+5bsaqBpEqw/JxfeTOzWW8RP
	63+4fu73kpzljQJW8HASa1einZepaa4sjKk2MUN82KXYXrFSomKJ4hALiBPWSlcK
	T/98rSr+3xeajTs2WtsPari4CymBmL4vvULKFG9N3GnO3c3BUZ5i8bTj5mak6wT9
	z3F+FoK11PE8+ZlyO8M0QPWnujsZ81o44O74JXGJz65Rmv0J2ZwpKXyw+5KhF8o1
	9VwURKg72Tp0DnOio2Mt1AyfuA5jSSGn9ZzRGYRIhFNAxQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3vhvspm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 22:27:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5094741c1c1so100814161cf.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 15:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774391261; x=1774996061; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d7o659NDRbqQiwXVOjyovY3N0yKj36qT/352Z2Pb2RY=;
        b=MZAiO6ZhRqprm0EcqJ4zf/n3pDldGyFkSHjEO4E4F6Lp83/P4r6pwvDU88rHshxmrU
         2cfXOfxqTPtDkDKJiYYDu8ATiRRdomXJUOJNCSFB8duPC/+JZ1tNzHFCzcj/HT3r/qRg
         7XI4uh6MaxVEbBu5TAAmj4WQRJjT/BbZLQ8cnLCl3xgYr9Hgf3d48nSP1UMRXFIeFpIH
         /q4yxXOnwR2QsG06zj7+hvUjM8MBjhvdaMkI7lzui5XrkKOdYE+Z2HtyXLrnZzzp9VZp
         6U6WGDdQtJp7Zx0w9+Cj9LB2bEAnMwT1tsO4hPZB7AnWEnV1P4uUNFG9R9im8uaRhm8S
         HstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774391261; x=1774996061;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d7o659NDRbqQiwXVOjyovY3N0yKj36qT/352Z2Pb2RY=;
        b=ZEoNzJFvTLuytsN/jMALPHmLve15WavRu1UI3C5EHx4jB4gzMSv4sKFWErubvGry4H
         pmPrGGnBSNF7qTh1/3e1oTf8iW16VYqkMvSQFcXQLOlPugam06kNrnZyFIu7nu98qtTq
         rbgAqYfMVDhIzSq+PH2hPJCG42Bi6L04lRx2qFoueiCq+ZNU4P0XfJ1rIiniOqQuc336
         LAsxn4ARXIlJWMzTbjdGC9yHQv8GWlbK7zqPYoU3KSlAv2pEqZ577q1kYZ2dngv1nmxS
         +c6LyJ4tqJynQiH9zGwWiNMhRks4jKJLzaaJwNTozgk/Bap9xzLA+kZF9JfuX6xS2YUV
         mGqw==
X-Forwarded-Encrypted: i=1; AJvYcCWyAGOseUZBkOBeWdhSlGGROWGCRKFql/Z6IgrArzyTlnK6fXogslOKmI/970GhWQuZZpc/OA4smNx7@vger.kernel.org
X-Gm-Message-State: AOJu0YwKv2DbinaS2vWspA4LmAfJ2Rvu/SO0TfyS7Qr5wputxS9SoEsT
	rjlQq8XmU6FmuuuLGR1ZvLUiEdw4Ya92HDOScBFPJKsPuDrG7e47afybDa3k1hQYljXuee7xoHF
	jkxTnUajO8aLpiR3nFSUsujSAFmZbG2FAin2AEmj3uoeYNga4hCaIeUCSlPtIMCVr
X-Gm-Gg: ATEYQzwn1Tr0UswJ2MH5a0/sSn/zTzwkMbCTKvmmR5No1AbvfnjrwlzNtkpjtzLtuX0
	aJQ+auN8LCKg53avxbYBrTwvI2OZw53TiRVipbmijGcECixn/hWdR+CXlSO4Yr2Q2rGXGHWNcCW
	C2TZ5Q4sxlZr3xUd2mjyLQNZZ3s6t1KUlu3eqZd0d81gFzb38rAOsaxQw9f5DD0tXmscEzs2dOG
	2VsVXXrj+W5t1Iw2uiXo+oBXVhz9XE7/0Q+LgbdIYbZSkgQ6DeinI8hfRB8xg7EjE5cYe+alNwD
	eFp/Pjrs8V3KZcOGOhamcZAdiXGCuWRDrQxpM4PZ7TL5IBfngwhVU6GzNrxhYwxR98gPOZhgbSH
	97T67Grl+D8jeyUBltDf8U7SEDKzHKjs5M82DnZAZzsrQkMvOn1zo/URjdr2ZZxSoLedOBRToDq
	cITHTwUrkB2Xt+ALq4k+c1qgjoaWom/P6UGG4=
X-Received: by 2002:a05:622a:4cd:b0:50b:51ad:35eb with SMTP id d75a77b69052e-50b80d3a8a7mr20870171cf.20.1774391261550;
        Tue, 24 Mar 2026 15:27:41 -0700 (PDT)
X-Received: by 2002:a05:622a:4cd:b0:50b:51ad:35eb with SMTP id d75a77b69052e-50b80d3a8a7mr20869901cf.20.1774391261137;
        Tue, 24 Mar 2026 15:27:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a296d7c93fsm724502e87.51.2026.03.24.15.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 15:27:38 -0700 (PDT)
Date: Wed, 25 Mar 2026 00:27:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Zijun Hu <zijun.hu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT v2] arm64: dts: qcom: glymur-crd: Enable WLAN and
 Bluetooth
Message-ID: <3reeaaukvhce3jm5t6a2zjh442zdcgstvs6rczoyrdu7v36nt2@jpv42upyexpt>
References: <20260324-glymur-dts-crd-enable-bt-wlan-v2-1-6afcf1ac277a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324-glymur-dts-crd-enable-bt-wlan-v2-1-6afcf1ac277a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE3MyBTYWx0ZWRfX+WEb5s3RvKWH
 ZREhNViUdQaB7mqEoere4VuEnY5XcpOw7Vj70/Bm7MMeUDpY3kXNCElTeqc1c3w/BOJoXKRxOL5
 6Iz0A88hMcilHIfQ0TLGh1M9+EKOMc1tagSHiilxwENGPCzENZVhkQ87w4KIpsBQV0h4q6eSJ8Y
 s4W3kCzKn9/bfyfkwELBpbseTAyErplTnb9XWvIhsPavxXL8K//mR/IvpqFHMotWfkxROzYKpTk
 NjasHZhKJlpOA+QskbCU8HynQ5dTT+2yMT9VmtjO5BWRvCCss0W945Uw8rpPnfulecq/Bomi1n/
 45vlshAOtfTwivNORQyqWlPuVWGjh19L5hmpguKir67JI+q0F1r0ZvDRspdwBI7LFoGL0NsvOBt
 eX60FL4oNjm0LRwrvpbYRWkHZ2eS6igDN6905rODF6niwWDU7rFoN1i4CM0GidujH3mN1q/trn5
 4v4LC+LK6GMHz7Koi9Q==
X-Authority-Analysis: v=2.4 cv=P5M3RyAu c=1 sm=1 tr=0 ts=69c30fde cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=kcT8zHn9ULDl9SQ3-_4A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 7G2-tBKCn4VceuJk4vrjn_nm6OXSF5W6
X-Proofpoint-GUID: 7G2-tBKCn4VceuJk4vrjn_nm6OXSF5W6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240173

On Tue, Mar 24, 2026 at 05:12:19PM +0200, Abel Vesa wrote:
> Both Glymur and Mahua CRDs feature a WCN7850 M.2 WLAN and Bluetooth
> combo card.
> 
> So describe both the 0.9V and the 3.3V regulators, then WCN7850 PMU and
> the PCIe WLAN and the UART Bluetooth nodes.
> 
> Do this in the Glymur CRD generic dtsi so that both Glymur and Mahua CRDs
> benefit from it towards enabling WLAN and Bluetooth functionality.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Sending as RFT since I only tested this on Glymur CRD.
> As far as I know, Mahua CRD uses the same WCN7850 board, but I do
> not have (yet) access to a Mahua CRD to test on.
> ---
> Changes in v2:
> - Rebased on next-20260323.
> - Address commit message issue reported by Zijun
> - Dropped the vddio1p2-supply as Zijun suggested.
> - Did not rework with the M.2 connector since the E Key is still
>   under review on the list.
> - Re-worked so that it is done in the generic CRD dtsi in order
>   to add the same support for Mahua CRD.
> - Link to v1: https://patch.msgid.link/20260309-glymur-dts-crd-enable-bt-wlan-v1-1-3badbddd5439@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 118 +++++++++++++++++++++++++++++--
>  1 file changed, 112 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
