Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20B6394EB0
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789384692; cv=none; b=rgTUYkHN4E389IsOI7MqiWMX0or4+hsPKcHlFWMuwUCvHXWoXixKjCBtwXq8IGmHAa3HID0hOg8Il73+KGbjMR5ZJpUk7IG2iBe4Nm42H2eMOKyhHfGIlZwCdiZqk1UxCq4DI6o8WgzXvfQLCzwGucBlemLFWohgD8EumuGSVXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789384692; c=relaxed/simple;
	bh=qyo572r093/Wuuigpug703R2+cl/gSCazJtTr3U4JHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jo+ygVeMi/HgSJXXXf7MI74d0IMSua/ETsMv4b4n27NWnU3ssVyVy5tg45D1XIdgdnE5LNmbKdu7MNmy7PVCbTN+QEov3iEuxZzp7SmIqtIJiX1mIEtC777UfESZTpb30O95+7F7d55Znqdzy4/364ebG/7EGNKG8Eh3Jugc6pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p74lKPfG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FOI0siKZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p74lKPfG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FOI0siKZ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmA2B3291626
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lu8CNw9bVINJIb/MTRXcrF6ffg/r+0oykIW5TY8O4Y4=; b=p74lKPfGoxBk3sgk
	Nv7jbyh+PyzNnEZXmPSeygceSiRc+hzxKGqPe8gSasJEoh9jI28KkTBcCvBuJBBC
	WzTOXA5JvbzXDVBVkTe8WhQNutMRPF9it0XS3DkwhDoWGJi87AXJ0+RlvEDct+CO
	FpWCASMm55uop92Bmk6T/9dn+zzxgMzrOQIb0RYNCmSme9cM+opFd9GTGy6LqdXv
	WLobHlPt1oeF94En8pYt/HsObrlB/40wMNOpvIJbiUxfXCT87bg3586GtWX2lorZ
	K+KSP/tphg2ZnwVCfvi3/hoL58VYSv1yosERpux0u3wiqzMpl+SntE0EUvlmh42G
	6L58/g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gperg8bak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 11:18:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e661ce1dcso55065985a.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 04:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789384688; x=1789989488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lu8CNw9bVINJIb/MTRXcrF6ffg/r+0oykIW5TY8O4Y4=;
        b=FOI0siKZqayydFs0/W1u2lLkarT0ELiH+2D4URE7lJmJlrAaQ6+uZrH7xhX/9yNMrC
         W5Mal3N2Lp4W8FfJ+E9kLilrFqn8RJu2oRtd3y/6V+u+IJgkqJo40Indnl+63UmdYyho
         J0QSft307NtIsZVciPZoZCkQ6TPB/ELnDQFH+LPyW5EiwUSV6Ni2jTvlIW9Zv7pfsJ51
         jsRSwMC/2Zw5slFcU6+rSj4Aq9ffEFfl5hOeb6VcXhOaxWSyDzCjQNnqWQ6Sz6sah4Mt
         6CEvruM5hEQJUFriFRme3P4hoqmks7y/XUxWyPY6WxhbolxM91rglWukNIPTjENgKE6m
         eVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789384688; x=1789989488;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lu8CNw9bVINJIb/MTRXcrF6ffg/r+0oykIW5TY8O4Y4=;
        b=IjNVKhQoDJ3CZvfOQOvRAxlSgyctHVEVpXcVA54gQ7A91X2uTWMLlsLGY9lwEmN1lK
         YECLo843ULTbmsxpqaIjcDiD0T7x9jpYJDZ0SUMa3EnoRHegeGcUN8SSVmye+zpAwriD
         r1KE3Swj/33CQDvOJO4/pNDRUbpF1jPbofXzw1DUU/Rom1aaGKR5WkbvpN2CgRDjq7fj
         S26Qb6bu5lHpjucsPB1mAtjUtwVJnvRZWiSmcJgFXGcyxpzCnxgaDfrggjMVucKj50kC
         0Brzi4APcwYeEfPn6tIT0HNCd9EES4dKRuqrPWJVpiq1HWn1W11GfKz4VDEiiEZ+9FrB
         t47g==
X-Forwarded-Encrypted: i=1; AKwUvBzHnOvxHehiyE8epMGvu+Bc3iZb534ipbvPXrPfOpSstcGV/q2ZLLa6VpxaioQpul7iK5UHZ9wqHV+g@vger.kernel.org
X-Gm-Message-State: AFuF++l79Bd/QlmwTq115lpmjDO+u0xZ451+DfjTz+teYwBeXwoRmGaR
	ZdwfGJBmocd0yg76sZMdgN8pVmPKBttu5OAmnzlEWMX99cuFENHY0uP1B8kXoOQl8OrS3LnlR6i
	6N9+fH+t2QFFKp+QHKcE7HvSnTg4AMYBy/nkhQpJiT3vj+OhJvjc4GDO8KjoI1gKr
X-Gm-Gg: AYBFou2ZEyzUeg6Pf+vtMx/dTHMOZWXJwwCjusRj2HdknaLFGx/qcYLbbQI39vYJtOc
	YPkzg80b+ucvRqsqi0oE5dEq2j/2pDk5Rav+6NeHCcQD/EsijZ7k85j6jrLkZ4XQmD24nyCV1d8
	Z30yszMW1L72AkKQ0hdhOl+shN+DCcKJrQSg0VTEw+m18OtDOfmhTllujrHRlea5YWEAFY9kWcT
	k9AfSK4BtGM+EXHdMdvqMUerQqY3sSP23291ufVcLwW8D6/l1RAml29FG172clPIWpPkYQ6xan9
	xpaiM4DBsimAK3fGLvcki6ww34OI5TuYuXJQKFd0cfcMVALMCAdPp/1AJ5OUbDd4eRb+xzaD1tb
	b90fX6wDU7Yogc0yrINfq8g==
X-Received: by 2002:a05:620a:170b:b0:939:8148:1e3d with SMTP id af79cd13be357-93a2987c21fmr216471685a.2.1789384688309;
        Mon, 14 Sep 2026 04:18:08 -0700 (PDT)
X-Received: by 2002:a05:620a:170b:b0:939:8148:1e3d with SMTP id af79cd13be357-93a2987c21fmr216464885a.2.1789384687844;
        Mon, 14 Sep 2026 04:18:07 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b593d7dbsm4143990a12.22.2026.09.14.04.18.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:18:07 -0700 (PDT)
Message-ID: <21722931-0a6c-444a-b23c-59b47dd82430@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:18:01 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 13/20] clk: qcom: smd-rpm: Add clocks for MSM8952
To: muzafferkadir@mainlining.org, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Lee Jones <lee@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, Dang Huynh <danct12@riseup.net>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        iommu@lists.linux.dev, mfd@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
        linux-input@vger.kernel.org
References: <20260912-msm8952-initial-support-v1-0-0e742578b524@mainlining.org>
 <20260912-msm8952-initial-support-v1-13-0e742578b524@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260912-msm8952-initial-support-v1-13-0e742578b524@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa7d7f1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=OuZLqq7tAAAA:8 a=lCfP1g0v9f8vL_Xsk8YA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: tUiFfNymMi75xwe17TsZaIJr_gTYTK48
X-Proofpoint-ORIG-GUID: tUiFfNymMi75xwe17TsZaIJr_gTYTK48
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE2MCBTYWx0ZWRfX+VkJhYez+BQE
 tOpv1+OPpHM+LkT8QrXsGBL5+EST7jzENcnhf3qhUp3CUf4I+v1jNsf5JFd7KJQ7iJPZWUmlGM9
 +Ln+oXqfBiCCWDVzNTxLTojJMAy7dRvX6UBMph7YXUzztZ38iO26Fi/bPBQ7C9fb01i9xb3pKSS
 77YvTkMx9OsWGyGgXy4v0ab4ZVtSF4AhtcxK1BHgeQbVFCi1Fg/6b2fDq0xkyYi74jaAuEETcp7
 lloHS/887PaRSeIVSedH2eOmj+Nvvwt6P1E62DXmIm488WpegJKrqT0ND7POmj3WnRYAStuzxcb
 4LolwKiG+I5OCPMDRj/42iXoLYHC+cRPLVN/7EcDpqgv7N5mCRO5JFCmwCn34H++z0YD9zNsFXw
 Cjb2VlbE4AhtTub34DHEj90eF3Q9wyDwYJ3kNYMbEXWiXCt9h8N0rii9+Erx3i979OMRKxBtSKs
 Ot+qpBxKXsmUIfGUAyw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE2MCBTYWx0ZWRfX60UVTN0tx4yb
 QEr20bXTmtcz+Y8n3NS9q2exisU24TCWZ6+d1H5zjxopzU2n+1RKXra0GdUOabNiqDgAPu15MEe
 8oemu49lsqa9NrvWYGXcvBYV7nlDTuA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140160

On 9/12/26 10:39 AM, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> MSM8952 has same clocks with MSM8976 and MSM8940.

Let's reuse the compatible then - add an entry to dt-bindings
where we have a 8952-specific compatible in case we ever need to
act on it specifically and a fallback to 8976, so that we don't need
to modify the driver needlessly.

Your DT then would look like:

compatible = "qcom,rpmcc-msm8952",
	     "qcom,rpmcc-msm8976";

Konrad
