Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F5744605B
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932842; cv=none; b=lrBCJYegwHnLVzm2NH6i24b0J1B2+Tl0lxIautBnOVipJ9j3tGIq/7P4qkFeGxvbWjmTEqXBb6qg0Q13q6yGgEk6TIOscxSbJXdHUVSr9Q/TpuqajMEW4t3QeImFjETUqJAvX+NS/mKZWeNqrg8OH0alaAnXwn/nPHY3StR9UQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932842; c=relaxed/simple;
	bh=+HiGs7ic+G67g+jK6ihA8DwHby0KUl5GrLnvv3fDxps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P/Yhec9hYAXkmGu7si2wRyHmcPdPsm4wCuD6Ohm+cwfILmg6YwOPqIEPzcCawZkrnSQNeguyEmzJEgjIlYrtEsPRJMfrmcfxXqFDUtGPZTfBGws9fC70+RwYgFAC3rurICAalG8TyHq3WB2Asp/NC06N+Xk8pDeocutcSo6U8Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RsrDEX8t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KkHk/HYX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RsrDEX8t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KkHk/HYX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925k6tJ1069318
	for <devicetree@vger.kernel.org>; Fri, 2 Oct 2026 09:20:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BEvD6iYviTx0ERjEtbXW1xNy
	bpDy8Ge//Ongv2RbrMI=; b=RsrDEX8tfSN1k4qR7Mkz/rYSek0nBT/75bonCZIp
	1QTD81buRrzX19IPc1/lX1lQwgla0bPdUhKe1DkPMkYO3xkQ5Js4Ode8N05rH5c8
	GklCBEhQyYD6CjzHxSLoGTIgqMt6Ep8fEjcymTNjtoJFweDAAiLiYXlU4xEl3402
	HmvmO5YiIuGjRZXAeHnsyj2F1S/eL0hwBxopyPAjjKr+hUXwVZ3OVUFA7c8mI4T+
	FMvJAWrorIZaNwd5zvLRFs/nbO51zSQoBlXqYT5G5+baLqYf5q5m/iPUpDoPLNAc
	9Cl96xd3JwGAdlhhh04WiDGBFOUF8TxWMHmX6TlP1Fem2A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1qukc66v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 09:20:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb93c874bso262713185a.0
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 02:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790932839; x=1791537639; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BEvD6iYviTx0ERjEtbXW1xNybpDy8Ge//Ongv2RbrMI=;
        b=KkHk/HYXgc6/N+B+dAb7RhFvVn0Ux02I3rAJ60byTGCfQUPxE7pSYVRE709m55WVPv
         5fAjy6eUcbwv5yMo1MixCGJbnWi1Q8qC1PE+84+g5mwYUIA6qVby93N14iJ6IgLGHNmp
         gq29m1nb0ruK4K9HdTfv2zHaG0DH5/Rqr33Q7jepuRgY6avlqBeZKwaQ7OjxfkKq2g06
         q2qLYzW4BXO4WNJ9cdktdUdge5d01F7qXY6XjawO8tvZWihluych8bdbI1YGtglXVVc+
         5Atzimv9OYVWCGN3SxpUjej8gAz6yvEOjK1rZk3mRdmVHtjaLzfjpbyD80OhU6VSwxo3
         LgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932839; x=1791537639;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BEvD6iYviTx0ERjEtbXW1xNybpDy8Ge//Ongv2RbrMI=;
        b=P1uCXwFEIC+2fFb/zFUwloOiP6/kUEcipBIzjW3Z8OycrtQw/Vk6+zWUMi7ngE9Cxe
         yiSt3YRS2WvAxkAkcrYiarWt+2/MiPMsh9v9Kbc8qMuMzd3Vh260B4v6v3RXdu68FyTT
         pwenyZuYEVBW8ThPK79pxmwyP5jopzEs3Hg3pWQhi+AB3T8LwpG1Mgk0RnGVZ/wSwdlg
         YqG3lRPmYnbnd8SI/CI8OEQbYy4kO086pGYq9KiyPeceKtRWI6lwHjLq8Bx5nYipNgCj
         WCCSNeRURHVy2ngHfCI61u4/dnsfRfcIjtt5qcsc4LlskQCv/dsPuaXLd99vrQ9AOmYg
         fdPw==
X-Forwarded-Encrypted: i=1; AKwUvBwZMto6GMwN6ux+wi4x6w2Nw1HaB0xhOW7j5Poyf0okJ0NQcJpq2+36Viz6vSajB5Q5zwbAGZF/nUip@vger.kernel.org
X-Gm-Message-State: AFuF++kne+apOBoGxGH9V8NXQNbn7AQhAYQFtvd4ITXIWFlMV5wrUQrz
	Zo+A5OYpbIJ3v6m1NKW3e8VdKTChIMAHMMKF6STBQgsl6EDuIQ6+7xfSn/YL6cGGlNRYpyQPyrY
	RugmmTW/Xen3ERPJmqn90Ei29CC5zIt3k+eEoCciZRruW7JPZn8WUaxx5mTN2HszVp+5YOzxj
X-Gm-Gg: AYBFou1ktx9wVjuVSvOf4JqAboOljcnrQOXHGZpqvivl2YQYOQX5sld5puwSmSGhmxG
	FWzfxB8KXFaSUgbHzpdTTyhPmsq+ZmRu7OqZIMRnPRnbChDGaLVci1MXkzrKRCy4F763mFbOKYB
	Tyy8EmYfJwGWkWwaXfsW49SJKJQfUbEaYQ0FXDwrlv8qKJEOawYP5ltVHe9uVwnzhROsGExeU5O
	OwHVtTl0o2hPUBAxxoMRjy/kAWYql2poCu5T4n0a3NMzHhN/X88DsfDpcYFWRTPzQl7gol65C5P
	mnfzK1feULfj0aSC7NC976U9wL1QErkmtwEreTnn1IaKcoI2KgPbnn6+6wM6iS45SXTpGcvT+7V
	Z2m6QR54iHsK3+Rg=
X-Received: by 2002:a05:620a:4406:b0:939:c7dc:8712 with SMTP id af79cd13be357-93cb5a5c9d6mr1029733685a.15.1790932838985;
        Fri, 02 Oct 2026 02:20:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4406:b0:939:c7dc:8712 with SMTP id af79cd13be357-93cb5a5c9d6mr1029729585a.15.1790932838313;
        Fri, 02 Oct 2026 02:20:38 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a030326132sm48429645e9.0.2026.10.02.02.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:20:37 -0700 (PDT)
Date: Fri, 2 Oct 2026 12:20:36 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8750: Add watchdog node
Message-ID: <sad5fandsyilvnj5b5huytervp3jfuf57ctfsm5qroxnrvvn6o@d4z3vv6kcwkn>
References: <20260930-sm8750-watchdog-v2-0-b16fcda275d2@oss.qualcomm.com>
 <20260930-sm8750-watchdog-v2-2-b16fcda275d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-sm8750-watchdog-v2-2-b16fcda275d2@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzNyBTYWx0ZWRfXzTptOfZiNdCK
 Fn8nBzhXJEDGQRJxCCduaKDj4dW6OHscnkk0EPCJFFpH1U3jtQ0HMEGCFY6bK0k2ixVpR3UVYxR
 /KF+gBIWK0mZqPXIlHZWAJhNN+pqYnc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzNyBTYWx0ZWRfX/BX2c3aq1W13
 T3PA4KwXtpsiq2/DMw1RMETOmNZAc8sWvM8d+6AICYTkB0lEEmDRvhstTXLf+MozZSa2AVL9zlO
 EWqQWK9Ed+3/dNFtSHhxmSDZoV9ztlUqulZr4D0fIuEya310mX0JrF8kyQ3FSlB+gNtEhZ8vsyV
 Y695AkUeeby+LLFmLQB9UPzYa8JBKAt2A8buVtA3Kr18q2pgBHA0txXyQRyW6xIR3Qw7sgm3Y+C
 BoHHzHvJIITLcgqCJz7E5l+5rwZdXij1cBA1KaPH8z3ULMdXX/VqHppMeRWxwJaiiJ3H7QwdZgN
 CyOIzFXYBLmxxfEn5TImN8JDEy3BePLQf8vvQhUUeNsDKhpz/Q5DlrZKM0h5ov5Ab5ZKpVvGetJ
 HJQfEBFXZHu68JKS9dIKceP55+Lk0XvGycvAEiNI3TL1vBtT5Cz3lyc6D1MY6TbdjmSdNgxW1Oz
 rYn0OcBgDfHHrtsRGIA==
X-Proofpoint-GUID: 0gN7v5-zhLj1HLk1jd8Dfvj6adeO1Dta
X-Authority-Analysis: v=2.4 cv=TdADJhQh c=1 sm=1 tr=0 ts=6abf7767 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=x2DRelJqk6z56t6zBn4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 0gN7v5-zhLj1HLk1jd8Dfvj6adeO1Dta
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020037

On 26-09-30 18:32:06, Komal Bajaj wrote:
> Add a node for the watchdog on the SM8750 SoC.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
