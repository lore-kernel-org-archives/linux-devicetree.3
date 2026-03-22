Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39AB35E95F
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 17:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774201669; cv=none; b=K7QxGuzwUsin0txH5QE8lRg/OWuCobfJnBknKqAlIWLiBpSSJMCVaxHboMsOgVHmX4Z3T2JwsiK35ju36zABHX/pGnKj7lUMWK7+wyjUiLNhusiL9+qHDmrP2ei6pwEiVmMPyDvocKiC8F8PfEtGtl/pBULrZtaUh5ytGoQAkzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774201669; c=relaxed/simple;
	bh=qHfrcSSixlXz1JdxXoVKXWLRz9QrW1vJKA4xePfpd7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A9ZIW+/SwvZ/cb9aFXoFNimAh6Z0bNyFwsnVgMQjH05uiAyLWKeGxtU5r8zfrVLPUYvACtVhiwNlhOeGihyF9OsN3XkGTmaT0QvzkSyzr9vSzZIQ+6pYpEZ484C0c8/I0VVKVrVKZnj695VAnq65GD+f/CiPn+fCyeAnM7l38Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VYqhs2jh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bQNY2t6G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VYqhs2jh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bQNY2t6G"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62M7DAhs3738067
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 17:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pi3yz4utIWc0wu4B02g881LB
	r0MDES4NNN5SFPyCDHA=; b=VYqhs2jh5J1k9WuLGBaocfBy1nuc+b63TOoOW8SE
	JaMh32QZKEYxbvK/TA4zMrf8tTM0wkPxLdNp8CZtBxbBfL07OHplcyJlOJrRlg6D
	7lGQ3efZ7ODvowILop1JCL4Y8SQm73hLKQ28TNwYjtrHNQ5h8iLA2NVCvaKsxich
	ix4eaGbv5VCqBUDNExOl8nKTUvrqvtlWYxzdaL+AeyHL02UnIPkledAx32prlCE1
	ce/pWQe2w3bPspe/ko4I3jCN6UKHy/yCqU/cFHOk8SNmfG3/+OjUjZ/iLVlnaySY
	jag/Eea4VvZYcn5gIqph7bPFQI0sle1tJfcskSZB2lKmjg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mgham1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 17:47:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509219f94b0so624681cf.3
        for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 10:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774201667; x=1774806467; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pi3yz4utIWc0wu4B02g881LBr0MDES4NNN5SFPyCDHA=;
        b=bQNY2t6G/0rAkgRDp8rB0qwuJ3dR0q6fSDboqWC72x2X0/EeTLOqM9QxS8qsRFf7Lw
         CB4T4gByGdwz8TEsk8+WaDQa0LkzCwb9B9fHozmUkDtQB5j9ClG8EVLOkF8n7AXxMswj
         9DIOqEkQVMcAD5b9WYRt+ZAWZyQGd+ER/xV52RmV0JzU0Wfbt2xeyhQ5yDES7nHdJK2X
         ELRdDUQix2yR0hcLIxc65lamNK4mg0z/qWIkctY9lABT1qxYGyhyn/r0Yf2Ssfa+3nK1
         Ger/Dgld3MyqYukzKweXcnvob6B/W2HUsBkF33HkFCT5Dy8HMon5Yd55Xm4cCUqNgGhg
         uP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774201667; x=1774806467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pi3yz4utIWc0wu4B02g881LBr0MDES4NNN5SFPyCDHA=;
        b=eA3NZywQcF1ZS/msP4KzjHPgdvKMPOeFUqjM3UMKDCpAUsLu/NqgHgBrzHqFveDta3
         +FFvFYZvbm1NfX4bjI9bOGIySEjJDhWth+Lz5kOYQ9WLh5m6uSbDQlfJByYK0HJtxkhD
         lE+XHkrPo1cCW2dXV5WTapc056SmEKQhdQxphHJHyVPGHu7igK2LYJ08FdYCQqd+wJlq
         V08BwZJjv5bFTi/rXjwLExKrBVym1ityoeqrBB0mVgRqidHKRG5MD11qlUTsFieL5o4p
         J9FxRtagixwBPurwszdfAXtjMH9MQPepZhxzVl2oI/W3wX9bjrN58d3nkr1frzka7VJm
         LVLg==
X-Forwarded-Encrypted: i=1; AJvYcCVX1tA1Rjo8rohtBDZBZVWGxz2qAYxNz+l0XmRtFDF6quSnHRMh8Fs3uGGWB2bYZvweS3R7hgb+gB5k@vger.kernel.org
X-Gm-Message-State: AOJu0YyTtM+Vz4XfmealgcRihA2tYfnZYfpTEXcOVLtaX2BX1qqD45AX
	RMOksYMGAuRjNK0BZWIP9zR1yX0mbI+UUjQOr7q3LVH0h8G/A1NEn/U0NIHrVxrLEmo2U4IeipE
	jlEc1yOejmo/WElTdsnxF60Ymv7qqA9rYfNpP0xpS8lRNKctZJvLsOcDfdPPqaF+4
X-Gm-Gg: ATEYQzx93WrbC3Rg5WRWoVooOb7hNTIccQUB2/NkBBXmNuh1zA4LuIrI8F2F+3WsXJc
	whd0t97w5a44ISmyMcohUgjICW/ux4rVpmp727+kG5YR16SDY0Cpv+kLrjO5xEIbcWJ+RRjChlm
	ci32LWnpDXjHBHyfBmZhYnoxG/GcDQQSeVWLZCkFRMGnJaWAIFdogaaSlZLz/q8XJnewr5idC8V
	FpNlFYd2GGV6do5eDN6WoF6WWbbHRphbUT+Sd4Js3/8A1DSf0f6tYUIMt0bGXRZT/EglYY4A63i
	kpBOaYgZviRLYebgfkwv2vqEa0PaPNSg9cTd7Sg+OhXsfAy4fIuEp8IWz0GRxjMvvsdfz+9lvf6
	HfxoWhRxW9FklIqhUxDzla+1bz2Txp6aNcf4RTRV/gx/JrHlSjwHXGN/2OTAzPYVKY1PfXSM66B
	jf8+wHJ0iM8ca0eB50p5DzxaE+rAasb7G1NbE=
X-Received: by 2002:ac8:59cf:0:b0:50b:2f1f:ffd3 with SMTP id d75a77b69052e-50b375682d1mr147647961cf.59.1774201667121;
        Sun, 22 Mar 2026 10:47:47 -0700 (PDT)
X-Received: by 2002:ac8:59cf:0:b0:50b:2f1f:ffd3 with SMTP id d75a77b69052e-50b375682d1mr147647651cf.59.1774201666657;
        Sun, 22 Mar 2026 10:47:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28530bd55sm1901747e87.72.2026.03.22.10.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 10:47:43 -0700 (PDT)
Date: Sun, 22 Mar 2026 19:47:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: eliza: Coding style clean-ups
Message-ID: <5ucl3sxq4nypw2kp2blcipnzbdtellpymrilbxkbhbjrwjdbth@gpass2a2rs6u>
References: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
 <20260322-eliza-base-dt-fixes-v1-1-c633a6064a24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322-eliza-base-dt-fixes-v1-1-c633a6064a24@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69c02b44 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=KXIq5dYrPAAvaokCsYQA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: puxJ8un3A2ZmDtKEhc8RGoc0U394VffA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIyMDE1NSBTYWx0ZWRfX8lXGSxZtO2Mz
 Exx2mIpMlX2GSonNeIa3ZYGod+U3FZ5ItNW23B11O+V0t2HxC1ciEzG54s6ZmdoV7ryqmc0EbHf
 QZBF3ZO5ffpal6jU6/3lSArLbi8sQiYQUUPHjSojSUt37k+3lP+GkG8GiyeUI2aN7E7+Roh+PID
 l14McM5qr2YTM8vxs+pkjXLwvtOOU8W+EesIZ5AO79JsqnP72p4h/bZ6rG0NDbJ6zo8HLbfpyzS
 MP1XZeNikF+7OpX8RE9NaEpu+UTz8DQ9lqgAgcY8ZB00Z3HW1NTazeX7uRT2hSHJ9OQzoK9Kx55
 ceT1GSWW5rIB37yBzdgnnTlMPFhLPldacmZsveL0GB/GPzdrHnxSUhkQJIwCh9Bpj0bIsfNq7F5
 iKk3valX+KcNC9ecm+LZK4lOnIkNZJyo4Zga8S7gUO/I4P3pigtiXNINC4gLds/04NCP6lAo8kJ
 WCWvujiTB51r5umPWpQ==
X-Proofpoint-GUID: puxJ8un3A2ZmDtKEhc8RGoc0U394VffA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_05,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603220155

On Sun, Mar 22, 2026 at 06:08:19PM +0200, Abel Vesa wrote:
> Some coding style issues were raised during review but the devicetree
> was merged meanwhile. Address them here.
> 
> These changes are non-functional.
> 
> Fixes: db7fe6963466 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 27 +++++++++++++++------------
>  1 file changed, 15 insertions(+), 12 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
