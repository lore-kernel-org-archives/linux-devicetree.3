Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569140;
	b=AhkH4CWlu+ncdEGPKYUxjjiyuxZ30kG//UGbz512DuQi+0t6lqnbLrq6niHmrSjEv1j3
	 mdRv0Th5xE+nFxH02evdrOVv23vlDS/kbnG6skbw5Gyjiw2wS7AV9WUSMmpXIrIvtSsww
	 8CogHIxD6mDUVqYbwpm5id78APGa54rFK4MlU0FYJc3vqTtJf+FhufbwmkdzaojO/BkWI
	 MEymOah2doZOBzQPN4QlDpdxE4pTvuQIUzbOUaS4ta3tRDmJl+wGjMhX++3DuZ6P7k1MP
	 WcVOD6rVqt9zLaHRaR2eCYzQN2QBi2M+L/7c4R04LP9wlu5QlXvDODsaxYgBWmbTgkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569140;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uGEbX7ewHLXjKOrnEAwIQ5NuoQ6GYnuPMjFfMhRkmzY=;
	b=Qh2Ov5HLjvoVGIW/axB3Sy5qoPghGIIBF7fw+cc/FIyRE8DqSxzqOhjsttbOYpAI9LmD
	 0XPRegwMSwCON2P9o59qRMOxFCxuZEmERcFWOJE1L0nBnGF9DHUzynV/OZS5xdSMmMPs0
	 laV3UEj08DLhnt2qmfx0XUDm4D72AWNDS0cTjuMrq+3QqKg8DiCEAk8ZGKqt8zJnOagar
	 RokgoUZZmAAiGabAF53eAG1fvjBnWFYAkFZJznZ1bE0Hh9s5JbxXom4UjxJpJ9Y5v/7s4
	 nN+CzzhAlJi1RSudseDUTNt/jkdS+jr5ucsb2mKYFjbvjIWbq5GGy0h39nIemWcjsrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AyQbDhhI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="L8oN0M/f";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76246606A31A
	for <Devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76246606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AyQbDhhI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L8oN0M/f
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j03Z756343
	for <Devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uGEbX7ewHLXjKOrnEAwIQ5NuoQ6GYnuPMjFfMhRkmzY=; b=AyQbDhhIrkFWR6Vk
	Qi2NR9JA3Zl2CUV7EWDi6niUDRqZIXrxHan5CO5/E/BXU7ve/rdkbmA1nMYiorTj
	uUnreypvOJoV9NBh7qXqdcP2SpKXHgjoLhz89Rwh0hy6JheE85O54i4M3fuBy9+K
	GPoUifUKk6HR/ZvKSW5RdHvWNFEesfA+HyQp4k8orY6iqKF5XuUB1191IkbZE+8P
	plpke5EwWoQ+7NfxTqbvPFLeYU9SR35EZlpu5h8sxqbblJm3JCdRo8AnJX/ALU05
	F/8Y9yWbh3i75DhlSJm/79KrlTXj29up/7QkDqsFQj2p0RS5n2rG7kpyuT0V4JEd
	ihpS0Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4tm3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <Devicetree@vger.kernel.org>; Wed, 21 Oct 2026 07:52:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea8a9cfe6so13426685a.2
        for <Devicetree@vger.kernel.org>; Wed, 21 Oct 2026 00:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792569138; x=1793173938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uGEbX7ewHLXjKOrnEAwIQ5NuoQ6GYnuPMjFfMhRkmzY=;
        b=L8oN0M/f0SafeWIOOTVJDB5c65jCkCoTZvBfUiRMPlv79Qlp1uSt0PZID56oUNL1Y3
         /mx34q0anqB9jrjPoPoloKUxA0k20/cDdwgL0Wq7DJM9u+RX+2/pJLhnePXMH/x+36Ey
         CJz/wyfjcuQFeC0CNDEv1vFOLLo12nCi1J1D2WtfNEAkfypaHZwosoXmRNCDvxrObGci
         8fUT30fNrmJg2+hc/o61vBMeb8RSGI/fQdv1K2V1NdkGuiveeKRec/pzsA00U1OhfW9/
         YWtK9bOFfof3MH53Ggd1J+jrLBbMSplt19rnpbV7HkzypY5YN8w9GdxuXNc0rtjwkaH/
         bV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569138; x=1793173938;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uGEbX7ewHLXjKOrnEAwIQ5NuoQ6GYnuPMjFfMhRkmzY=;
        b=wP2xA3Ee0E3RV95GysrZQsgj13dPyBICmCjf65mQuk7z8G0emnrzdaB3n/+1jnQGD2
         VucXh8W2hkhcLrMglCWi88ZZ8qSj/pQl+qzslQAjGgSTDJ1cBbXm7v+cZiVF7cNoR2HK
         ZCe5ajbnU7hhO0f6pZ9O86gQb+6EB04qsOLUI5gjHzBs1tS9uIWwC3xmDS/va5/80ifK
         yCEAGRqXf5y7onI77wlQwlvI7BJBCAENQ7pQhMsWGqXxFLapHtbSwnS2RCj9Dt26KhxP
         VDhoGvjldIv7hAeGUv5bPUkba3XNk/Bs9ISm5oV4O9V+bwNpzx6ShRPNj+Ozp5vV7LMG
         JssQ==
X-Forwarded-Encrypted: i=1; AKwUvBwaufK1La9h+sksHQsptLghfKMLniSF9yzPF9sGZPiDDvv9aFcAwLm8PBP1bwGrbKRAQcJWynJVSRC0@vger.kernel.org
X-Gm-Message-State: AFq9FYI9OsNpRL+BnWQAb0pGpbz9tJlE1eF1NXsAci5W2bDwz1MCINOS
	JuanoD/VOxEgwGKR+ld2QMdMEz6ANQI6akYtP1B1dtb15QuRdIUd+QlAUl0kdW4ZKcCVkRFiQ8a
	uKAsiiRW4SFHrSgx1q5M+ZUZLTHBPJlxtiaq3YTwaiozz9tT6DFx8D7IWlAhnodTa
X-Gm-Gg: AYBFou1nMeD+mOaBeH28No5gNZTpUPoezEx3ZPDaQ+WDzLAf0wCue6ZLUutEvqfI0v6
	2y+r6g13pNpTGdRMKV46jwkNFmmfCssbBBJHPjWSCBNz5Nfj/5rjv2KRFibVWe9gbsZlnnujTJc
	4dp17OEQ5TGTKSi6RdtkOKPqirVppv+1C0d9cyrrKuu+gdHPrAGkeOGocaNIO2KtbPkAaoUS0Za
	h6az1twj5SZ40+/5kYDQWJlEZK6uytvaLQ+f80L1kLJ47R2UiSGKdfdiAnZ6FiEF2xGfAOKHIIt
	P9T1Kl+7/okRzbkvR09kgEp6Ztzfq/pvhcrX7AYIHX7rdQfhv3uW15UQjMFS2GnNxPhDkxWS8TQ
	8ktkk9OjuNhemMWG7UW/W3g==
X-Received: by 2002:ac8:5707:0:b0:535:6cc1:589b with SMTP id d75a77b69052e-5369b4a11bamr23255991cf.1.1792569137590;
        Wed, 21 Oct 2026 00:52:17 -0700 (PDT)
X-Received: by 2002:ac8:5707:0:b0:535:6cc1:589b with SMTP id d75a77b69052e-5369b4a11bamr23255851cf.1.1792569137150;
        Wed, 21 Oct 2026 00:52:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4679009aacsm49878266b.78.2026.10.21.00.52.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 00:52:16 -0700 (PDT)
Message-ID: <08dea1cb-aaf2-4c62-ba9d-8bef2d6d44a1@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:52:10 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 7/7] arm64: dts: qcom: sc7180: Add sc7180-trogdor.its
 FIT image script
To: Douglas Anderson <dianders@chromium.org>,
        Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Brian Norris <briannorris@chromium.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
        linux-arm-msm@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org,
        Julius Werner <jwerner@chromium.org>,
        Saravana Kannan
 <saravanak@kernel.org>, Will Deacon <will@kernel.org>,
        Michal Simek <michal.simek@amd.com>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
References: <20261020153652.2907186-1-dianders@chromium.org>
 <20261020083501.RFC.7.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020083501.RFC.7.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ujUwMUhnDMuLyPCMeur0gtielLwl9oFN
X-Proofpoint-GUID: ujUwMUhnDMuLyPCMeur0gtielLwl9oFN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfXwMIRXnXqbAms
 hBZNE2koB8R2WhLCvE6apxKtZ+1QqQxPG7fhfq4hUsipALYweHagDOfk6O+daL7nlVWiCsHGmMH
 4kcBLA1BSoWPpKUAlWAwVxBuJKPfW4o=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad86f32 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=hCCUOKFY6uXp-TWS5dAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfXzNd16kLV9Typ
 1Kv9Zu/6BZ34Dx1HXaN4Heshli8Y6L/L1yksZyUget46wZmnXLLLU32edODaine09OQXDI4Y54g
 a6N9/94xVCPDYXJxrOC/qLhZ/3cG1RzJzVdnbhbfF/txqIDEHd9kUyfOBwFOhm72769pi0E/xt2
 uR5k6n9xZghz69axHoDVP1LDxnlDlvdbyhFvADpn162uvEVizSr9dqSER9jVjm1lhB5PQgWIsDQ
 RMabT4jEL1ys6jSLFXqYt2CBUa0ayHY1UuWdFAIil1FIn3beD0+MBEdZtZYFZBgzNYJ5QCJdhuy
 +UIQ4/jAEOeCgCZREcrqjglFLyjdDzJ1J+IP74rCIakc46BxCnXn15/408WipzVbYahaWH9bxf3
 FtS+JmMtV+nMWfLiFSXdYb7fFEXeu/96vfQ1S/GkrB34k17Y/EKk8G4SmA5tLgzCTLgewNy060i
 eEUhsTuiwnlu0Vh2xFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210031

On 10/20/26 5:35 PM, Douglas Anderson wrote:
> Add an Image Tree Source (`sc7180-trogdor.its`) describing the FIT
> image for SC7180 Trogdor family boards using `Image-framed.lz4` and
> LZ4-compressed board DTBs (`*.dtb.lz4`), allowing the Trogdor FIT image
> to be built with:
> 
>   make FIT_ITS=qcom/sc7180-trogdor.its image.fit
> 
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
