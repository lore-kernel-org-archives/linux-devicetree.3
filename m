Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795620283;
	b=T6smD9N2qVdmWSFFtn+oAaifcJFh+3FkxpAXpuAc+eLoZOD2lfd4tKq8R7fQltsSc7E4
	 I0Afy0Oa6aUz3MwnpqkcIxTggwGceoQj/Q9JFsA9Z6tUlKzbo6cT7UlmW43rKOTByngf8
	 QLEHmgZcUa1r2LqvJdbA3Grgji+DJXYGhwDTOAvYgVNG815IfvhEDE2VuFZ9WSdI/Tcg2
	 5z/7GTIfmEfzCfA5ZFKGUlq6211eCvVbV4LUtrr2WdWhkgxZIXXdnECHxJWyYZ4hOPFjd
	 thfPbZfTpnSEwE9ixqv/7Ym9LvbjAc+SruqEt0vSwzPljX88DOSlff7LubpzyLkFOtA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620283;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BWI0oTPS6UWP+KHreqzTyFzt/bLKfNI1fMUEgGA2TjQ=;
	b=etiWNyDm0+wJ8QApI7NUo1hywm4I0xG5lKDj7eTHEXsqYBQm/NwnbYW3PnLOfRlC/KdO
	 kslFpXUe1KP2DvhS+9Lx+OFWSMlKrJ5rIrESVUhtJ5gZWZE4A7FP6Nba+T4gyJKZ25TOC
	 zu+BSaQLikTmuRcrYvnZhabACwFPKng8vfxL272nxgxlfPXVjscAg+M2pUE/9QWpSPxWt
	 grB72TqQRvYvXBnXkt7BQ8plTYDnq2rsOWDeds8Hnyi3OafIU4E6KFvguf535wKqbBnkM
	 cdB0/o8bAT6/khTiiOIOi63Zg6BB6/YAkoWfeWqpaZia/LpAmksorB31+98BpS+Pa3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="OpB6FU//";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cJM3cew1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47BC606A334
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 15:24:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A47BC606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OpB6FU//;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cJM3cew1
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APELlt8724143
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 15:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BWI0oTPS6UWP+KHreqzTyFzt/bLKfNI1fMUEgGA2TjQ=; b=OpB6FU//8xOqb7OS
	5fVG54KpU7ZjNVKjctadQgIBzM1pOMtfT+p8RLJQKyYAAI7DZyJ5qt+UOaP/9pq4
	u8sBWRPln3bzRSPYJOuCVV7hYFjGloUQUfoatqf+FTAUdrFoUXI8IRA4nJgD5hO1
	itivGuWNLrBgEQ4KnYHzi73YpEIkNS2hpwNeAhy7ZKl8SxdU6IFb+LEhb4BFL6GZ
	DmcN5Y+58aqVqcFdGV9uBwFeAW+ByxC0qjFbCfgk8N4RUZhVJhAGLOUIiB4jt5Kz
	fAq9A5IwNKwk2eFTo41CSn49JtybruJZBKPkwkWdyxqWMvEUDUxgC06m1qXnG5Yg
	jtr1nw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5yaxrs54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 15:24:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b3a74ee77fso3861003a91.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 07:24:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795620281; cv=none;
        d=google.com; s=arc-20260327;
        b=aGEv/rR9QULOIUaOzOa6dxHboU/XOjxYJPxWCc174maj3Q59Mv3T3p6erxF50xiGJP
         ZCOexsERA/FwMH04aqwO5sVCE17YfyB10QCBRlV0Z/dT8mj9XHH0ZrxbO6wyJnJwFoE3
         Z+zGVd3rz6encz363C7+mgbiw1QFIUDeaVWSC4MES51FCOi99v4isTvaccvRDAZ370bj
         3FCWzsd3yS96JFmRvjDQDwS1zuuvkWL8vV7T4G0EvlJyRKr7oevAyuC1dHl7iqbdtxrq
         vawytxPfcu9+GB8lpptDic0xJ17dlAfvJRHLAsk+s2z028VjCYiWjFQXnWSmk9tToVS2
         dEnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BWI0oTPS6UWP+KHreqzTyFzt/bLKfNI1fMUEgGA2TjQ=;
        fh=C7aI4Y4C0I3gO5bjGe31AjOWMhADSp5vWE/viG2hsQI=;
        b=HaA+PCeAdCQBjrYOhJHQ1wZivzFJVtTqD617zZkIjRElvZicytb8s9jEIgsfuQXyxx
         hjbWpwNg4Q4YjInJvQBGQTENn8lJKH4fz9VTed+mVdL43BGhiqWR7XVyN6K8nUDVeg54
         JzsvZLqh9rB7qRMOLXTzw7lRztGk36T+zxka4A86bfKqXctU7h40XV2CJ93xPGblGb7n
         tgsCGw4Ub/S2/nFyW4Oidy36uQPREYjoOB4p1tWn7WXkRI9aAe2s5p5+YYITbhzf2hYo
         bshaE1pBPbe+po4x2+IXO62RclMsM9aPXrwKb9zkYNoKeRg1UA8UVqgvacqvDjhkMYjF
         lSsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795620281; x=1796225081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BWI0oTPS6UWP+KHreqzTyFzt/bLKfNI1fMUEgGA2TjQ=;
        b=cJM3cew1hkvYIyL1ViCsj3kK76klrSGicdUUgE9mOCNL1W6o5ORm0MgbmkkbZ++ky/
         2vUkNgT84tLjE6cV8KtUcoRzbEb4AngRs2uu2ze3e9psU18rHrty8zOfx2nTRki6hsLi
         ntrpPDqvdLM4Wo8v4CGdX4tcetEwGUIhKyej55Krwtwr4kzuKa6iIn6MVOxmio/d6kwT
         5b4N2UeS1wwaV3RF6Zb0f+T2aTYGrOhSSvPL+aVi08R7KJALyVVCmJEa0Ui6lQZvUKQM
         ArdimzhQYaG2Y4q3n+7rcEbhRmBce9JUP/ag7s9govOUlGhur1nxeuCr65eOi75ajjRT
         pU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620281; x=1796225081;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BWI0oTPS6UWP+KHreqzTyFzt/bLKfNI1fMUEgGA2TjQ=;
        b=oou5gNExWKbhsUWxSIoTEveeJzsvc5dVG7ggHB6UjLkPynf5g5StIyj+r6+fd127BJ
         mJhRXCQZnm9Ru9zA5jmgLK99atibQRjrtT76h4Qfe7LUovGuw0A+7csa3WuTFgzakdQ6
         RIKy4vlxA5qQ5C61qerXOKZExFKmUnIWyNc10cGTosD3uMBePSZI8Bsa9Qj0eyOC3inv
         OROpiEDOuKKAK80J1qwWuf7uSJEQ/Aq3qWV3nNrWMWzY8F6L5q9pQWXfyPSw8TqMFH2M
         QoiR35vXhGCdQ3VcqnxOO0sTdGR11jceByLyE9fSy16Nb9hfpa0/Gl/uhO1Yz3EparKk
         uUpA==
X-Forwarded-Encrypted: i=1; AL+hErHGubN+5tAP1vBMTOZINbttFzYWHCeNyubg8SYFWDRpJTmC70jgZQWvnkO4wYA244yqTLH9daZaPia0@vger.kernel.org
X-Gm-Message-State: APuU4Z9DxPCyI/008hxAPFxRVEmoF7d54acBDcRhIrxUBi36/mudcRvE
	X9+lMtB71k10Zq2Grn99UZLwKgS6f3jSKsMYwbFatAcyZhLXM1mjui/D1AVi5tGhtlo7IHu6Vwo
	U6dkYtBRuxo8RMwnHALc8V887H9Nfa+IJAev1MyEgSLSx0518hxtA5cQaHu5eU3OxY9vEdlcsTu
	k/WsNwpWrT4vWHy83SlDjtQDT2ZXQf/W7jSYbx4Y0=
X-Gm-Gg: AZFdTZdOv4bu3cz1B6Iby9R5hBvQb5EoYd7YRUOpyxyiWXmUOMo7185zF+ytolC7ZhA
	19EzJue2Wwgh/Xx0eO7gFQ6GY0E5rT2uiqYTZQ2tyattT5tRYX+QfdFzuFkmcaaJMqSoWKA8YhI
	rMsWNzX2ZBepwhRchRNe8MVeTy6ZgkCgm/UJkA+7E1l1aXrTdvTUParpqlfw==
X-Received: by 2002:a17:90b:2ecb:b0:3ac:8446:c1a5 with SMTP id 98e67ed59e1d1-3b41c988620mr15762984a91.48.1795620281129;
        Wed, 25 Nov 2026 07:24:41 -0800 (PST)
X-Received: by 2002:a17:90b:2ecb:b0:3ac:8446:c1a5 with SMTP id
 98e67ed59e1d1-3b41c988620mr15762922a91.48.1795620280668; Wed, 25 Nov 2026
 07:24:40 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com> <20261125-halliday-dts-v3-2-5c8311c0b70b@gmail.com>
In-Reply-To: <20261125-halliday-dts-v3-2-5c8311c0b70b@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 16:24:29 +0100
X-Gm-Features: Aa3M54pQyww1I_PbdCBse1VupHYmzcQQ8jGP2HKCbG8YvURb7jcXXUW3MJhTLAI
Message-ID: <CAPx+jO9aHqEwVu3j5CdVTsfrhk8cMRawA5rj51EA7AdVtn-U+A@mail.gmail.com>
Subject: Re: [PATCH v3 02/14] dt-bindings: power: qcom,rpmpd: document the
 Halliday RPMh Power Domains
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
        Stanley Jhu <stanleyjhu@google.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: V7h3IWBVbsZFP24CFYEKXffhZw5qONYN
X-Proofpoint-ORIG-GUID: V7h3IWBVbsZFP24CFYEKXffhZw5qONYN
X-Authority-Analysis: v=2.4 cv=ULpIjyfy c=1 sm=1 tr=0 ts=6b06fdb9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=yRSEYQ9GznzmN70rNvQA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2MSBTYWx0ZWRfX9FRP+dlgz5R5
 vf9kF7jtxAk9ntBytgBGxO/5d0ZJoNvqd+dBhEdfxj3rt9QR8Q7IUvtwGIVC0cPoHzH9/T/Yfmd
 j9EG07GkNI+tRr8RkZOKTcLTf1/Knx+/VRTZP4yg58NkIVZRwT1AaaSy/bukb4vRjApDp/fin9l
 5RAnN0AOqeF5vu3sxqJHRDb7DmyXr7LMhmjqROKgcakebhYM4McUsVOKVqkGvrNWVK2EiCmXlbg
 wID4fopfxDV0UWVT7gJ96VOf5Ymhqw2PzqtmO2UCBm8q/DlK8lz1Q7UdBU0G3Nl7ZNyIhycqOyi
 LNP6crcLt5ddkj0EJtokHQocF4odscZoREre4kQa5xvlqkGqA31ebDeyrY5nYx0nax9gEfAolYI
 XKU0pwJxIQWJ3mf1rtaDUheA4ZyZpSkEy8oN+mhtomCPBttRhi4bF2pDKov2S2KijiFMne+mDnH
 2h/aPQ6PlKQ5t0bALOw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2MSBTYWx0ZWRfX9w4iY+XfNFJc
 czy4FvCbd5M5M9sCt9hPUtKitMp86D9NZ5BnsVRHeZn1Bf3sbIS9fjqAVXrBZNC5+TCzVEsua+Z
 nvEJgvsenPqg+Keo1BB5rJhbHottE8g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250061

On Wed, Nov 25, 2026 at 4:44=E2=80=AFAM Stanislav Aleksandrov
<lightofmysoul@gmail.com> wrote:
>
> Document the RPMh Power Domains on the Qualcomm Halliday SoC
> (SXR2250P). Its command DB has the same power domains as SM8450
> (CX, EBI, GFX, LCX, LMX, MMCX, MSS, MX and MXC), so use
> qcom,sm8450-rpmhpd as the fallback compatible.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Applied for next (available at the immutable dt branch as well), thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Do=
cumentation/devicetree/bindings/power/qcom,rpmpd.yaml
> index 8ee1c25a7c9d..663baae9cc64 100644
> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> @@ -82,6 +82,10 @@ properties:
>            - enum:
>                - qcom,maili-rpmhpd
>            - const: qcom,hawi-rpmhpd
> +      - items:
> +          - enum:
> +              - qcom,halliday-rpmhpd
> +          - const: qcom,sm8450-rpmhpd
>
>    '#power-domain-cells':
>      const: 1
>
> --
> 2.55.0
>
