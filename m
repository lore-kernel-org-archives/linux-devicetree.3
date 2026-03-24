Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54552571D7
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 02:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774318192; cv=none; b=SUA2HBbCvviWnhlJaLxD5+n2mN7JOqi4N5fiidNiznF+CUXswjUyQxUh1a1wD+bfVnm9Hvpu16KHCnqZpVTcrR0DGn+SOifi1pGJjIwV/xf5ca3V9ePMuUV8ghqUCN6yWOXu9XDLX/Twx0PyF/pbxrYp/ZmbtLrbMajNnVzc+Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774318192; c=relaxed/simple;
	bh=37vPBBAzTZ3/lo9gvOGeuopFoiWJS0MKCuHWiza282c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l8BU5irZ3dRgTEW8KI23o56o41m5xawRDe6jQBrRclu9wnbssNJFlGgzgwCaOECTuCvDs3luYrQ8lBPELi5fUR4DIkU++mIiMmhLMsfVBPuU3d/VfR1LiWz2PqWq3llYFPqAPfYfl2FVU810gOeZHAOLM4Ga4lv3y5sjoyRJzds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=me.ssier.org; spf=pass smtp.mailfrom=me.ssier.org; dkim=pass (2048-bit key) header.d=me-ssier-org.20230601.gappssmtp.com header.i=@me-ssier-org.20230601.gappssmtp.com header.b=MHkybLtX; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=me.ssier.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.ssier.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me-ssier-org.20230601.gappssmtp.com header.i=@me-ssier-org.20230601.gappssmtp.com header.b="MHkybLtX"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8cd8a189f44so484317485a.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 19:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=me-ssier-org.20230601.gappssmtp.com; s=20230601; t=1774318189; x=1774922989; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C5ZJoTMOV2ASUMfnuWTwy6IQmOeUZviHlyu/QYJ4be0=;
        b=MHkybLtXVRRLGzpOSeBqelcAdO3Pzem+zCiOVSWVeqcSeubTOBGeFw2uuV88w4FB0U
         0kr0AV6D8OMLFejDNwtbT0mH6MYBgBvw3GShgagKRcf+SI30sXIkQzGNAi55yo9fms8Z
         RU459C6RzoZ4Rw/ZCv1YerYd1chNjYI1Bnr5fW1WNSo8Gxqrox1p15Gk5sxyS3G9LYbk
         7qlXf1cwpgPuKQ6ldF1CzidtzAdrBqNQAmrZmC/rSUg3oFQJDMGgq0+x7sHsC4TrmNUi
         ByOYlT/yZSk/w/DZ0clpknczd5ZcdqJyfAiqnoYD8B3ah+kVtFfPZtfQFL7yCIur+0y+
         rR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774318189; x=1774922989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C5ZJoTMOV2ASUMfnuWTwy6IQmOeUZviHlyu/QYJ4be0=;
        b=rvUuajkiRYqF2qjcElYpdDsxW1pLml0P3isXUb3EswDz5neTkxsTSHHG+nktVVQaIE
         n6EYydfhTfMTxdzsZntVMFjFPkFuzgYRrxAK1wsTAwENyuMmLM3OmPbNSvHAsoTyFfwN
         Cr+7SMpxQ+cj5pjaPE9uvo7MwQ1nYMEOGBqy7mv0fFMfzAnnqXuWRlJuAwQ7KYoORVie
         k83QLgN4rtZF/14Xeb8VtjloZqhUEyjd3mqaBNPPz32DLN2h8GruQvGdoau1Ok8LsLEL
         hyglTvmleXDWwDn5rGrE+I0VA5cvwWICGcbXo9KGVSQgZ++ozKYsTfZub6WCQp83dQHQ
         3kVg==
X-Forwarded-Encrypted: i=1; AJvYcCWMFs6+/HCZc6yMQxUESoAOkArFy4SWX+N+Pp3ZG+K1qvDovYn9yOaP46qLqcuXx/0TXpQ5TvLGzH/F@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2LqWiirB3vZZG+hA7VvghRx/viBQaVkR2e0KJ9T/zpV5ZYRLS
	+HNiTXvos6zqPXbX8QfQXaMUWGSO3orRB7DZMeyIqe/izegqMOpCSrgZQu0aWBGIGxM=
X-Gm-Gg: ATEYQzyt0/6gszJkLqQILneX1tv2w1znWA1AHHaIK+5YfindW7VA27tCt0wRz8DZfAJ
	TnsWbLoOBKI6QrsOmPUaptq0GAhc3e8kpH6TqmBirclrjB3DWfYwDHq7c1+dsX22p3PxAYrQQmN
	wFFg8TZvIfPP/sB2uvrKsIAVusNMCWVQU9xVCli0pXnwoBOT8m+ooQVF39GVYYQuTE1PjBeAKFa
	7zGp37Jagvnf+EX+msWOmGooK+N81KkXzH+j+s8+wi2Xh4XmfwjruLW4Nf028xH//14g9MQauyR
	ekcLDgPpERVJav+SKwasvqUfzB68TjmWhEH7PsPfLxf8w6Ip5scoBOrSG+5M4XOfLZ8+exyCNgO
	WhGeebg3QXtMRpBs1X9yqeL/cykjMmaxUtMgJZTmDHCx8XCAYbKqEbPGppKMnBuElxGqOSD3YBu
	dL6tts4fRm+if54OG5LQoy4JRaQ4rOg4I=
X-Received: by 2002:a05:620a:1987:b0:8cf:bd15:b537 with SMTP id af79cd13be357-8cfc80bbb08mr2160211785a.60.1774318188297;
        Mon, 23 Mar 2026 19:09:48 -0700 (PDT)
Received: from [192.168.2.8] ([74.14.125.72])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc8f5f979sm895014685a.6.2026.03.23.19.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 19:09:47 -0700 (PDT)
Message-ID: <b09a51bf-26b8-4c88-ab23-c92ddc1fb801@me.ssier.org>
Date: Mon, 23 Mar 2026 22:09:35 -0400
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] interconnect: qcom: let MSM8974 interconnect work
 again
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Georgi Djakov <djakov@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Luca Weiss
 <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Brian Masney <bmasney@redhat.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
Content-Language: en-US
From: Alexandre Messier <alex@me.ssier.org>
In-Reply-To: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-03-23 20:10, Dmitry Baryshkov wrote:
> Commit d6edc31f3a68 ("clk: qcom: smd-rpm: Separate out interconnect bus
> clocks") moved control over several RPM resources from the clk-smd-rpm
> driver to the icc-rpm.c interconnect helpers. Most of the platforms were
> fixed before that commit or shortly after. However the MSM8974 was left
> as a foster child in broken state. Fix the loose ends and reenable
> interconnects on that platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v2:
> - Swapped order of clocks and clock-names properties (Konrad)
> - Corrected the ocmem comment regarding core clock (Konrad)
> - Link to v1: https://lore.kernel.org/r/20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com
> 
> ---
> Dmitry Baryshkov (9):
>       dt-bindings: interconnect: qcom,msm8974: drop bus clocks
>       dt-bindings: interconnect: qcom,msm8974: use qcom,rpm-common
>       interconnect: qcom: drop unused is_on flag
>       interconnect: qcom: icc-rpm: allow overwriting get_bw callback
>       interconnect: qcom: define OCMEM bus resource
>       interconnect: qcom: let platforms declare their bugginess
>       interconnect: qcom: msm8974: switch to the main icc-rpm driver
>       interconnect: qcom: msm8974: expand DEFINE_QNODE macros
>       ARM: dts: qcom: msm8974: Drop RPM bus clocks
> 
>  .../bindings/interconnect/qcom,msm8974.yaml        |   28 +-
>  arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |   21 +-
>  drivers/interconnect/qcom/icc-rpm-clocks.c         |    6 +
>  drivers/interconnect/qcom/icc-rpm.c                |   18 +-
>  drivers/interconnect/qcom/icc-rpm.h                |    7 +-
>  drivers/interconnect/qcom/msm8974.c                | 1637 +++++++++++++++-----
>  6 files changed, 1274 insertions(+), 443 deletions(-)
> ---
> base-commit: 8e5a478b6d6a5bb0a3d52147862b15e4d826af19
> change-id: 20260322-msm8974-icc-0ac4c28e139a
> 
> Best regards,
> --  
> With best wishes
> Dmitry
> 
> 

Tried this patch series on top of 7.0-rc5, using "htc,m8", and can confirm the device boots properly now!

I do see these messages in the kernel log now:

[    0.692540] ocmem fdd00000.sram: error -ENOENT: Unable to get core clock
[    0.692582] ocmem fdd00000.sram: probe with driver ocmem failed with error -2
[   24.173125] mmcc-msm8974 fd8c0000.clock-controller: sync_state() pending due to fdd00000.sram

I do not know if that error was expected or not.

In any case:

Tested-by: Alexandre Messier <alex@me.ssier.org>
