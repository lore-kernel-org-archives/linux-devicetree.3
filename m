Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BE64AE8A9
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 11:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790595886; cv=none; b=E/mS/4FsP9j3kSV9xZCZUA1KkS2RtEkfmCKoMmnEaU70FXgyEJEv1f1d21YxMgJ8UJU0kekEdZeA68IcWJ3ETNjmLmnwPRmKYYSUZBD9NlMk6Bv6n6yTG1PeqifBK//8ccHnQZ1H+TFjHUJ4vfAJx65y1J0qgrIxEvCSsGMS06o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790595886; c=relaxed/simple;
	bh=/p0VSccA4zU4DeQiVeywobz5EwNE5arEy1oLTPc55ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RCJZoikNpdKcGn/DQ2HKmNB0lPQWh/J50hYbUBfHk2pqjDCQhf69/80ANrptXlmvS/7jvDX6TtYa0p+5/BYV1MckA03icdHer3GlC7JGVMZnVRPCAEZNUOJqStWlY146bncYxKmfVdgWg33L5xPxQMHJHVxbLCuWh4BXDpmnm/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=au6rqKpD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dmTG96KY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="au6rqKpD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dmTG96KY"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBANua2294774
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 11:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+g1gQEPVu6NTWa1Scj5gCEUL
	9c3gDqxk89YzewKsiV0=; b=au6rqKpDwMLbn4UyWq13uFvqH3CuRYWGBdBmzyFi
	gFptUnmPRcaA3d1TN0z90zkM01FPZK7J3dGUQePMrIyCT+KrFZ41i27k6EYPeTE2
	RC3s8L3gqOFAWBNBnbV66dcOrScRa60UNF7BBEeV/71Kmoyaf1/nbfz5ZyXf6JSP
	oUKCDk15cwEuYyUxTpFSP9PcGHCEAV3dwHz4KCjGBsSX0nfVL58wwYLYz3B/uayU
	R3oPJ3DQeis/NxChU7QBaOMpkfaxZWsE5Axbn7jlJ3tv9j3qlegZpeVHXkfmM7Ag
	SxHC3XvuM8FbnDYAfWPfTapKMcWBHBtC0kaiA0lSpmbYwQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyhubhc0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 11:44:43 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-343eadc0ff3so213830eec.1
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 04:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790595883; x=1791200683; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+g1gQEPVu6NTWa1Scj5gCEUL9c3gDqxk89YzewKsiV0=;
        b=dmTG96KYmReOxFSyA5ANZXCQUEMSYWXaYcW8M9d6x2h/CrEYJ/Ir5Wzx4+VhpHfpLQ
         i33GJEibt5h5zflf4hUvuLgOOfDIWOjE9iwHbeRAJITlBqZrQDVFlDKOhQ5Yqtmop3cX
         nDd5DRx72NHw0qnVxbE3xmFojFGPtVU+DIp4UWQ2YCjDgQAxQSAGFn5annpE4ZXlPn0s
         qyTmwsUyUFXsUIbh0meu0hQ4rH+y10YIawOVP7wzUzXKou3ymx9W3wq9LnuNXQJ/idlS
         /WJv7pePAhvGzjh5aCVT9jemWP3bCw31QWJFJO/Q7RZYgQBIfcb4t2QrL9yf4G2Rke88
         Z3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790595883; x=1791200683;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+g1gQEPVu6NTWa1Scj5gCEUL9c3gDqxk89YzewKsiV0=;
        b=XRr+ts4SWLrTouToAOs5wSkh6TRTpCgtcA1HYtFyaHyIlBqGMeqQK96un7szPsTmY7
         RNSDoO9wkacsAofXu1b0hzNs1LRD8vGAMc/O/Nhu6zUa60Nbt3ko0ZdQzvP0vtGXxAk9
         YMefOq7YGYBbELzr0ZrtaJLkPvSrjh0ehtt06Jq+7nR7vNCfXbRIDoUT2kExQVxMu0Jx
         Vm4e4DtNLXlFr8vrXq717AIx/Gzj1gUbbOvmUHUilTJpWOaA/6REsQqVH11kFt3O/5SU
         B4pli0fRu2M+TT/SlbCcwXT8+rzz0wBHqSjN6CELkh++Na5YCxoBkoW8+/hOdlzzMx/C
         HCkA==
X-Forwarded-Encrypted: i=1; AKwUvBxRFshn9SGwOjIYlM9NINQFtLfpnuQn+BWgJ1krSGlQhvAmXJiEaSxdDYThO5MLSKooFy5CBGHqkMGm@vger.kernel.org
X-Gm-Message-State: AFuF++lq6qXzshHe8NyeIRcL4Kly0yGV8zRHZWKSagB2KV4L4GVnZ9lC
	zR/cJKpdXstb0fBPMDyEzHVRs1twW+FP9sg8g0ljK/UddZQ+WNYoCUq39t9kPKV0fsXS9mvFel2
	bvsB9NkbcgwKfpLeRaM49QQeVccBG0wHmKl7zkherEWL7DrZkWFhI9G6AXB/KGHl2
X-Gm-Gg: AYBFou3+dxonXzy+UcGoGjosUTT76xn6CFQQ4ApdbSv8oAE0+jH/hSlqkcn6F2+pBnL
	2ARniepjLlW2umcLOTUIDjCNUkUjpY3n84o0nWQ/biKR0xd2BqPD0WDagwoNW/Spwc0oEd3/3F8
	jx6icEsdWky+jezdziISDcjLYY8wSP1yMb06BgFBX3VVI6hLPL20/NnuL6N8Z6App/ns+nOhlmJ
	5FfbEcwphd4lFmxrX3Cl/frL+EVsulHrMqX04Y5/3gqfznHkrvFWtFMLU8lee8nvF18r9drgbYb
	3RLxSbkoKGq53nVSOtNxCYptVM/U2Q5jTGi9XE6rPeXJ1JU+kFp2ACOIieQlIj9/bu93v7wFKBx
	h96erHzrBG2QaSRM1d9zqrfNnrfiFR67+u286KDT1eA==
X-Received: by 2002:a05:701b:4591:10b0:143:1bb1:3305 with SMTP id a92af1059eb24-146d0871d4emr8380062c88.22.1790595883137;
        Mon, 28 Sep 2026 04:44:43 -0700 (PDT)
X-Received: by 2002:a05:701b:4591:10b0:143:1bb1:3305 with SMTP id a92af1059eb24-146d0871d4emr8380032c88.22.1790595882565;
        Mon, 28 Sep 2026 04:44:42 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34a1f82e33asm4457920eec.20.2026.09.28.04.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 04:44:42 -0700 (PDT)
Date: Mon, 28 Sep 2026 19:44:36 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: rtc: qcom-pm8xxx: Document PMM8654AU RTC
Message-ID: <arpTJAyDAAuAzPrv@QCOM-aGQu4IUr3Y>
References: <20260904074541.590485-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904074541.590485-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: N5b1c6KSnZxCwRhsol7p95pOQvk-Tv6g
X-Authority-Analysis: v=2.4 cv=C7F8WgP+ c=1 sm=1 tr=0 ts=6aba532b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=YW182EFpsI5OemYN5WYA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: N5b1c6KSnZxCwRhsol7p95pOQvk-Tv6g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0NiBTYWx0ZWRfXwmDebkRfxei7
 GGGERur41fsMYqyO4iJ8ELX/NxVfS//U5MsTDtCMn+nUPcE3ijhYmeHy9D+xFlrkc66/HnSLNG2
 KFPG0YaOSTeH0m86UlRrZlJJAUDkDjK/jBscgDGLAPn8FStEI5Rmncdr0hTIa31Whyko4r4uP9n
 ByrfQKC3Rf3UHEC9tlxGVPUdkJvPkwq5BvOSANWmpEcSQF2oVbFpmvUmxv7YIHuDzLcq/by+a6g
 OZcTD7X1vQBe4sd4ax8/Z1AAmT4RiqLVUs3zyn2KhvwGUwywx+jaorKYmNBP7ZJ/Kei8iM4euMx
 M132c6xG6QFK3H8PTIc4sEh02rmjcRlZaK3bYHoHtb2y70FFy+olt+pz3XKJFqzw/D1RICfox23
 Qr2jwrTc3tySzl3NtxH+I3vZ60LxHbrQESCpqucGj0Z6t7LByYiUF2O2d0HrvXosCHnlXo/9qsx
 y38B1o74HnQ1ifIqHzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0NiBTYWx0ZWRfX3gB9MMqBMy5M
 P856wP96gZ2aCdmCWmt7txqSHzwP6RR6nx6GguCD5Z9L7sVoUDvNhed/NV6vvVnaKr5Jk509Zg/
 zoq5C8vea47WKgT2cVFtQdcMxE6XkCk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280046

On Fri, Sep 04, 2026 at 03:45:41PM +0800, Shawn Guo wrote:
> Document Qualcomm PMM8654AU PMIC RTC which is compatible with PMK8350
> RTC.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Hi Alexandre,

I have a DTS series depending on this change and so that being blocked
for weeks. I will include it into the DTS series to unblock the
progress (routing it through arm-soc tree).

Shawn

> ---
>  Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
> index 7497dc3ac5b2..78fa1d5ed028 100644
> --- a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
> @@ -17,6 +17,9 @@ properties:
>            - qcom,pm8921-rtc
>            - qcom,pm8941-rtc
>            - qcom,pmk8350-rtc
> +      - items:
> +          - const: qcom,pmm8654au-rtc
> +          - const: qcom,pmk8350-rtc
>        - items:
>            - enum:
>                - qcom,pm8018-rtc
> -- 
> 2.43.0
> 
