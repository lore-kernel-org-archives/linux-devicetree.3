Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FBC37E5E7
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 10:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787047344; cv=none; b=bIxSb+wwGIf02hVjeDZIU6CisAB+NtjYycRVEj9HcU/mktcm77KMSqw8QoaqXfYkirc3CzybPRQigrvPxHEe6ilT/3YHvtGGCDjFWLuJvOHxON7gGyBs93HkiFiIMiFkvie5TxRRsgKIut95d9XBJa5LtTzSBsENHrOb9t/Xk+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787047344; c=relaxed/simple;
	bh=BZqcWaqu+rq5FB9tqXK3e4Bntj8NSh8srxUuMqjzxEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oFakiMlTNtRgXj9cfAe8LK2RU62Ij5j4E16wH6p3YVnQVsz3gMCiEa12djF/HzDZTjgOLtpFWf/BFbEPmEKMwD9i740HH2Tc+tch9AxAMzJXt99yC2Y/3DIJbjCQvaK+ubvqq6w2kpYPKzH3cOm+QlsZhbttm5AylhEjSiYdb6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mBJigU4s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h57GfnhO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mBJigU4s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h57GfnhO"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BGBb644980
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 10:02:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gKtcZjbBOfHo3Kkb7BtMQ73HlCTfqy+fk/1E8Z1N6Xg=; b=mBJigU4sVcEo/i0B
	jSrWWvtdyhApq8UdbdXXExhZr5FQF8dPZULE0kY2hrihDqkDTI+sfFKSLs8eIlhN
	ouACxr9VBTgsIb1cWuziMGllA/Aai8zjDNQEcDllYglxezMNQFRUqLeI2CQZJF7z
	MvhRXssijPE2Ow3uhvLVfgWnTLB73T4U9gFJq7lbjSglMuJwst8a1Eiwex8QsiD3
	+Dy25i+R2fXUBUNnHaBSdK81HiKhdBoGqwVMsxQzG0WOryPeZQLNrMwMUwGgGiWC
	PgvA4cu2xjoZnvI7s+EDZPNVbmlkkVh3QWh+XkDySGsPm7sG70NhfQ2ayOnYuqom
	OshV9w==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4611byds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 10:02:21 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-738be9df36fso10480137.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 03:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787047341; x=1787652141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gKtcZjbBOfHo3Kkb7BtMQ73HlCTfqy+fk/1E8Z1N6Xg=;
        b=h57GfnhO16f2OkrQU+Yp2ZabOI/zzXD2UhiA/IZNIVTZBLJE/UMlYOZv/UVKvw+3uF
         2I+hBdyD9JidASgdwtR09ASuUVeBJmfGWDPZ+gnMUjCstk0SQKzRocMRsg71qsosDnIJ
         QTRj/lTar9M+Z6GP5rY0ONuM6isTlmo4ThjxXDdbvHbmovNqPezp9LwME9l8bTZVy0Wp
         e/VxRE5IK/eYRhhBEVT3GydXXu/LE/1RBL6RZlszAeUJHd4Q1aLMyWxwbfkKG/ZH5Dmi
         HEv0ugDwwGZGQievBYzW6IXrePPqKJrbwQlFX2rW1MT5y4u7ofJMelvUyc1PDWINmOY0
         pE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787047341; x=1787652141;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gKtcZjbBOfHo3Kkb7BtMQ73HlCTfqy+fk/1E8Z1N6Xg=;
        b=kXFv8w9ZSqOkeoQL/cY4PoSgAyrlUhbsoYN2uRPqsBaVxq/lyBGBV4vjsBZuQW/Db/
         P5uAlKzYr4jBjwVipg83GfpgMoLAcmfPTizChm75oSvQ1GHWGE9SEd9aO4y6AouDTS/l
         +1iIl2A1jOwem09saQvu/ZnJvoODOImmp+24g25Gih671di7nv65FMqV6+m0Q4VOXTHs
         tIyfmDhfR9FFPHwErcjsc7J9RLI/0GVeUpoeIPd4KIG2M0p5O/faz7D6/YtcTKMzbmJR
         ldRDhKwXDME0K6iPC8bQ/XR1yXjLEVVG+yJHmjRpOlDxgpFQPoS3Nyv9QioUt1bZwVxM
         /BiA==
X-Forwarded-Encrypted: i=1; AHgh+RrwIZ/XEaxl47zfMb/JBIEEFsIRkuIo8FrSmLYbzgiB7KS0ODEUSPCUOstJqJh4YGEgMil0ixW1ErSQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzZau+gY9tPn3JFhQtbKafROBXHaENF0Fbt1KhJqUxYduLaqGGr
	ygh2RNVDJAwpxa2nrSrPo2mMZY6i9eEpdxI232elutzRE0vstZMeUG3FWJaERXggDmY356+oRik
	0obJRojPSBCplhSXSvU+Db7x2OApRYdx4ft1z7wJf+n/f7hVMB1MWCZJeZTLuQ4vn
X-Gm-Gg: AR+sD108cI9HVvUorPpwZTgj+A7T1ZhTaGze2SXvnVAgWZnZfx6IDjRDS1Fu2fJH3LC
	Bek55fACvdi8MzFIuMhaSC+PK++D7rCTw88Vh3/Ohmo21Ch5VFJge2GYLVi32MJwWVDEYQOMkfI
	Y+YRD9Cp2BRFsW19VYTdP4E4J9R//bE2lnzKxQgUOJoJS9kmftfrJx7eARF7MbGq6wzcs/Knf6V
	NLDOBnFM4Ao1Nq+9uFOsh4Tbl2Q1T+1KaMt/eqNg8dy8Cgfo0O6oyQfe5c1xXqF8e7MFBbNqWeN
	A0qRYhoRl00nPzbKtctp84DtM4QH2+GLwWSD4xKC2b0ZJwQ4VpWfYuB6NSMtnLMh2tw0T2d69MU
	LPxvF0tlYEuxdiuUP+ajulZw7
X-Received: by 2002:a05:6102:5091:b0:72f:6669:286a with SMTP id ada2fe7eead31-76f2c540eb2mr2244153137.2.1787047341154;
        Tue, 18 Aug 2026 03:02:21 -0700 (PDT)
X-Received: by 2002:a05:6102:5091:b0:72f:6669:286a with SMTP id ada2fe7eead31-76f2c540eb2mr2244135137.2.1787047340715;
        Tue, 18 Aug 2026 03:02:20 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d8596d4csm1517213a12.22.2026.08.18.03.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 03:02:19 -0700 (PDT)
Message-ID: <c72378dd-edde-49c9-833f-d107f6573989@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 12:02:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] usb: chipidea: msm: keep the glue device
 runtime-active
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang
 <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Stephen Boyd <stephen.boyd@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, Greg Kroah-Hartman <gregkh@suse.de>,
        Peter Chen <peter.chen@nxp.com>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
 <20260810-msm8974-usb-hsic-v1-6-e5f93ea76ffa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb-hsic-v1-6-e5f93ea76ffa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YsoZZ0ANlwQ7zGQKHQr7i-YB4HLlS3io
X-Proofpoint-ORIG-GUID: YsoZZ0ANlwQ7zGQKHQr7i-YB4HLlS3io
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3MyBTYWx0ZWRfX9VTnavh9FvdC
 JiZu77g69KXnvyQI4EDPsvy9jI+MfyQXAecJiCtm2OkzgkOb1AytHCkLHVv5UJDS5vaw6Qhg3yw
 +WTBJ/Bpet6ATbqYNvak0DiKlaS7PKU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3MyBTYWx0ZWRfXyXbbHeJl/iVI
 DcDsMNF1+JhHJYZluGLWVfaI57R7hO+I5nRKQg1jxCdg8focd0EgoS8WzsAtd7viGf/RwRTY57x
 H76o35ZAWpvpjlBw6JA+P/lEDLFEemofuEjrqvguyuhNW78Usg4rAJm+HqYDf7J6hUPX3Lr/c+X
 7UhkzPIt5NqADs9QDrP6va/sWkLQwFLhcg0lAmBz6KP/OPsj7caBzvr0vEFCuEi7hdnmBNHJ++Q
 rsTs4t80UuhTJSl13Uz4HQjJPC5GQJ63+ITSVcRZ6zgijZWsmGNpMS0D0lcclh2koE1C79gK1Z5
 ZZzkPVfLyGX8J/KzmVt6GdJK4b4Dc9d6e831w3MRmN5qKufGuNQrTsAw92js86JQP8DhZzLAH7E
 4TFabkft0B4pEN9WEZ+j2hVluKYreS4M0XeQVw3wQtnJliic0ZNuccO8COBe9iTmY/VgwVvCuBu
 H3RREWIWA4RNoH5fOdQ==
X-Authority-Analysis: v=2.4 cv=UslT8ewB c=1 sm=1 tr=0 ts=6a842dad cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=GzGGmIZ6zSJ6oW9ANs4A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180073

On 8/10/26 5:42 PM, Dmitry Baryshkov wrote:
> The msm chipidea glue enables runtime PM with pm_runtime_no_callbacks()
> and nothing pinning it active. Right after a successful probe the
> driver core's pm_request_idle() runtime-suspends the glue (the ci core
> child has runtime PM disabled, so it does not hold its parent), and
> when the glue sits in a power domain - the HSIC instances live in the
> USB_HS_HSIC GDSC on msm8974 - genpd then powers the domain off
> underneath the running controller. The EHCI register file reads back
> zeroes, an onboard hub's connect is never seen, and subsequent bus
> accesses into the unpowered block wedge the interconnect, eventually
> taking the whole SoC down.
> 
> Pin the glue runtime-active so the domain stays powered for the
> lifetime of the controller. Proper low-power handling can later be
> built on the child's runtime PM together with the HSIC wakeup
> interrupt.
> 
> Fixes: 2d0cdcc5a0e4 ("USB: gadget: Implement runtime PM for MSM bus glue driver")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

FWIW downstream seems to implement "real" runpm, so perhaps your
agent can have some fun with that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
