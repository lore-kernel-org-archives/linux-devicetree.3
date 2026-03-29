Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E253002C8
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 09:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774777963; cv=none; b=Q6tH9dtQ7JZDdOm81Nt7h4o+CyNLzMHi0CsPwGQxSEoYNBpuw7P/qFJ1BQg4/5I+I0N+NeGDKZcKA2mgPEzFQxF3HSL6/UYkjV81Vtc1WamJ0Jn/bW4F8i7uazFtaDnOH8k/YZC1cegtne4+7Z2j1eH7nq4jB/xp4Otd4wgDEr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774777963; c=relaxed/simple;
	bh=7I1eZDkRK/wdoYxZ7s+Ps63Cn8C3cZQaKdTWPLvtd8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H2W1wndfhNM6vp8O+/1wQvuLs0mWUZLFuklLb3cKNGUxseI+2YZzha7OstNMW9pFBJyh+vNA2tCDHpWnEXOgPXR4uaI+7OMLN/IHo3AME4M7vJIpWUDkLwnP9Ear1d9rdzF+SelLeR9DQFn+aaVIyp3A80HQ71OjckVBiEUb0cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DgBXDthx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dnXl+ouP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DgBXDthx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dnXl+ouP"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62T6fY6M1133419
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 09:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hAyNkY+C3fVpD3lC1c6+6VJB
	YgiejZKZd/p+VA35QAk=; b=DgBXDthxv5tldkiJRuVhdhJOm1JntCp8ib32vvFd
	RoBiF+V/tECzgqQFTGzs9azaf3Kb7oG6v0MhZzhdQGzhNXEC6b7ubvFu+QNZ+TUt
	N+tVoeifX6wP6uTT3yhnPvxuXtNw2UV/SNnqhAiIcjk5PA1HwzB6n5XMycT5Z4Fx
	cOcTh1lVqwNYqbp0UJdo/qMTZeeTPXm1RwtRmN8oYkVW9ufbYq4WbkneiLkTuiQx
	OufqQEIixd4QVQsZuGxRhqWwGp2Nok663vnGN4CcncCmNxzvFj6hIhSBpTJ98c9Y
	cyAmjXYZk2XxDjitYA4Z/t64eOC74HPnFcFbOOs9o6UU/w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d672uahwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 09:52:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5090e08dcfcso102609281cf.0
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 02:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774777959; x=1775382759; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hAyNkY+C3fVpD3lC1c6+6VJBYgiejZKZd/p+VA35QAk=;
        b=dnXl+ouPVigFEwqbh2pAOGlvFbzv/+T6ea/PFG9zJhKr3bSLktCImrQvBJt+b+U0HE
         Y7gPQ2alC8JUaluNfdvvSipJtiKTtDh2feUz5vpTypmLTjU5BnkC15neFXdjvKdFUXBg
         50EBgUJcir1xyih6Ju6AMI/PXwo+wj/tp3MB4EywvgX0fA9TYCbt/2lnvnPbrnieHFX2
         BxeogZcOVZB94yD710xJNzrLYwZ5ZZuUPy5j5MAw0xyqQVji3aUGij6EftjOJGG8ifTC
         Iv2mmBp0kadMF3pR8dQCrjYJG7ecg0coMpDgkP1QmMvrP2/zrqLhveKglJwSPANd71DQ
         i1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774777959; x=1775382759;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hAyNkY+C3fVpD3lC1c6+6VJBYgiejZKZd/p+VA35QAk=;
        b=MzQ3aCxUOAASC4qmenQIBM/gpxkZ5fCC/00p6vJM6zjc/xuvwqmvcJCIuzXlR/eJrK
         Kf936NkWWXwVJWvgpF2o/zqUgYkv6kwRxStpbfQt8JWfrvnTMFtJ7KWd+wtinX5WtvW2
         rY1TRY89vubm1Id38PeEkd7OUTVRsVWvpk6nDBPoTi35h+cm+Itjh/3SVQREsdQHku+8
         dvHqH+rI4JzMeuqOS94jczaBlACQDRwJZX5u45PWMJ6q1YBqOM1GbV2m4nIRFGKn7Sc0
         W831uz59oWR2hyGSDrzR1a82HTYG7EcIzVLfAb6eZjYIsCDvM3fLra7gz22OoPVDvOnD
         4mXA==
X-Forwarded-Encrypted: i=1; AJvYcCVA4BKKS6qpRJt0rCFCFDGAyhDT0W4kK2zlo7dBhv8x1FGCmRzKv5wZbXgxKqRIugvOTIURB5zwCqSc@vger.kernel.org
X-Gm-Message-State: AOJu0YyQAehIqqu+/orrJVd5DQu9aJ1ED/ChIlHgwuMf50yNT3CYkUT/
	TH70BrMGX1JB/O2WbwJckLKhE4N6QsrhXgITMQnpzW8IewzIwcSahcSvnpT26NItmWRsE41sqNC
	p3UQO9irvS/FJXXcZX93REzqVHLzaooUzPO7VfyTK7SgcmhFjYcs88D5E4riZQ1StFifbWmXF
X-Gm-Gg: ATEYQzw8HpoTRl3olGjM1RCjD9G+Pcj8c5BPko4h69sp6qNx4Tk06fzpzD8832zSJpv
	RCB62Z2Vc2CqXm11ISWmaoVimXZzDanHi7sU2dykRYJvrMOukdBiQSBp4b99qQyuhp+SnxyfRPD
	5sWoHcIVvnajWDkji8+hy6vskWunYMQ9VKdL/mjNKLCTDUhEMG8uaX64h7VlZNVZwrhMb4Rh7ZG
	5H9yVO0PsuZVuQzRNCuSP6wclQ3heRmOdbl8zVdTEcErR/ShxHn2xSLArjj2zgyI22qrn/R8YWc
	bm9UD3ty3SbY2aodYBA5ZtHjORiTOUWfon9HU38BDfISfzIRtpujV5Ebl++FqV6re/6fUMJ0lSN
	DjSDt6J5CYb2MbmvZ36nN9EPb/6rw0On7RnmyIIa6klv26S5a0EQKFGDMX3+l+8Ffnqg7dNoXvk
	UPhMnpzSPMF3rDEP+4dyEe3TquXTtKoiExLKs=
X-Received: by 2002:ac8:5f14:0:b0:50b:532c:2ab0 with SMTP id d75a77b69052e-50ba383e5ffmr110867731cf.4.1774777959398;
        Sun, 29 Mar 2026 02:52:39 -0700 (PDT)
X-Received: by 2002:ac8:5f14:0:b0:50b:532c:2ab0 with SMTP id d75a77b69052e-50ba383e5ffmr110867571cf.4.1774777958955;
        Sun, 29 Mar 2026 02:52:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c8391fe90sm8782231fa.42.2026.03.29.02.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 02:52:37 -0700 (PDT)
Date: Sun, 29 Mar 2026 12:52:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, stable@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add
 PMI632 Type-C property
Message-ID: <raecqyz4r7je5s6ecyclffwoi7kqt2oqwctj6aevj5tsfuxfkz@5i2jb5i62thx>
References: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
 <20260329-ginkgo-add-usb-ir-vib-v2-5-870e0745e55e@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329-ginkgo-add-usb-ir-vib-v2-5-870e0745e55e@gmail.com>
X-Proofpoint-GUID: TemQcE76XoDhezHrrGNTGW9nVFwUgH1S
X-Proofpoint-ORIG-GUID: TemQcE76XoDhezHrrGNTGW9nVFwUgH1S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA3NSBTYWx0ZWRfX3oPX+FYMsslX
 mCxLy6tfrwDK3Y00pIgJf0SCi7VTFALpYllBxIy4QKtRBQMTB1VstbUx/Yic/0Wxptl0gU8zMc9
 brQzXEwDthu67usZktUEwkl5+3WRsIEzGE1hYYmway/nsMog4iBg8Hgn8DWvVln6vrbBaeGoU6Q
 IBynNkxMz+RI1pzr+xuWEB0cZogOTqgCdCR8CJ4cE8OjtAoasj17Vq/dYuuHKYxXjjyTw9jjvY4
 mads83c8SXWpozWZQhoHaoz2RfKsFZlNP1PGBLc3sG71hMptMXmCirp8ILi+8LTSNom0S9Evgdo
 +aJn1plApmBJxygGtaeOkE5FLcG8u62HxPH401+gl32OOuuAybYjuj9IMXqpBW/c3npq2GLPvzM
 3pRbynHlZUdFJhuV8QrzScekIBJTuHdibNtvlBPwAITy+sZ1LdORDVl6XF1CbRYQFacEQ7EdZiA
 Gtr7n5ju1l7V69+Z35w==
X-Authority-Analysis: v=2.4 cv=Ae683nXG c=1 sm=1 tr=0 ts=69c8f668 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=4paqipjyf0t-I0uxfbgA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290075

On Sun, Mar 29, 2026 at 04:48:00AM +0000, Biswapriyo Nath wrote:
> The USB-C port is used for powering external devices and transfer
> data from/to them.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
>  .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
