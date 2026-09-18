Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41E3501F4A
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 14:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789743051; cv=none; b=BNyBKwrvz2eZk9gcFHjQawmDNE4CsZZ/9tIytyg75VhgtmIgS/Oy9oiLYoS+SPomCKNaHFNwMTXmCDl8ANnL5UmPUIdxhpIhNiEvTgdtoyuSFUWh906XDhfsGmB93zaxrSbkgyD5kQ+2cq8O4Kl2JiYM1lPposWqn6QQqUnd3zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789743051; c=relaxed/simple;
	bh=3g32ZEKgqgdm0mzzfeeD6m0KdEMdwsvPWO8RE57p70U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BKTO1wXefQHPIx4B+FVCL23N0iEFaxmxnm0DFsKJxU9y8xhbXlBKulaYuoQFsRIQ31074Sc80tV/nUz8rubeKgFjN3khP3cttEnqzMFTxnM8kG/GaHzB6oh7o54kOqFvCyDcUY7OYu+rnDNa/J0JIvQJap/TiE2ef8SyWnr+bMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=A7uI7+nT; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="A7uI7+nT"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f8694aeso48045766b.0
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 07:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789743041; x=1790347841; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r59C/B+bGqeFr3iprC+rozYulFppGtTTZNSFZMONdm8=;
        b=A7uI7+nT5gTJYtUZNUuYVj0NK/8INYXpvT+dj48RmCsB57fE/H/rXc36w5gh5/p22S
         p+U7aE1ARtIxOHE+TjLcNDwh9HRz30R1WDJV8m4SEgj6xvuSnN+Zet7n1YCLuo6/lLJE
         odhfsumAtx6xlZH1ZVm7ZJw14YK1AeITvdumui3LFC/QDAlGy4jsev4AD2mQKpO4fAzm
         BpJYHF1aqFycfttDoX64FQqtf8nSH6Gqcw0HS2/5NrS5HZ3YFH463J8BM1SqmddbbH3o
         BAtPLeUI1sjVn/3vr8PZISNMnL1EV713XZl2bCoMfttdl7jMlD2T9VTjl8BsYBTwPBUm
         S9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789743041; x=1790347841;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r59C/B+bGqeFr3iprC+rozYulFppGtTTZNSFZMONdm8=;
        b=JwJC4fPh3lXuMNg9D7YF+zpY4chlm6eMxzn4F7NiJlkQab2T5pg0+oezelzhHiLEW1
         i3TeLdkC46Trn1awjH3aEDueXA5Vi4V5atrKi51PMTtozgMXKttZHWXcX96KAXKkBaPy
         ahXkE10sg28SmMkoe4XZ2xmjjURwuio8QXCwen1Qx2sosXFSAFa8qb6j4bqBvMSohlt0
         7WgK1sQl45CDNtYOYyJ+i0j8x/qV+rU70Z9UedUfDg8MRDKCJ66HMycF0a9TY1geq7bG
         1dCnaABPhrOu5EvfoXYSPSeYcXW0zSJlj6F+Cb4TSuEGpSSkr0EjjGvgu63cNzBPUxWL
         ezbQ==
X-Forwarded-Encrypted: i=1; AKwUvByYg5/oIkCa4Sj5cCoycSCGJtE15D4KHyVhyi4wMdAxbZphIHyLswDZbh34ztNpY+T2SoLn8ySDAl6B@vger.kernel.org
X-Gm-Message-State: AFuF++lpGQAGMC8W2wy5Tq/xdn017GRXU15W0EKXU14Ve5+PL5IiY2sA
	u7O2gMh+xNPyW7S5xY3UjzNLM6EvagMPSDQi1F4f/lQZchPCO9a1megJH+XoRdBPkoM=
X-Gm-Gg: AYBFou2OAyLDMEB12Q0yTSjd1hIYRPuMvSu/9o1ulYAVdinRl2/dsNKR+GWT1wr7Dwq
	ZkRg/0gfcBjHUkGbAQ8d5CklvpS+kolDdKoL7w0hbImkLzA/Pm7fC/10E2Wjf0AcYOhKSsmQkdD
	hcGsD+B0p2lU6BZG8oSdMQ/2uY/Z62LzPCRIawYCMCEeTzVRt9PZcCFMsgJER1Da2+wIa9/6zHl
	M6hnQR+/mCvx4Jt9u011THYe+eeykkAuIaqwBzTe29kIDws9kYuxor6SbBjlm/4ct0F//ZQKXhw
	PaVKYizHit5LWUhBMQNKO3TO7r01f5iYUtsHbiDZsInvhFSvBSpeGkiga48sBnlhXr71eWHqiwR
	mo3r/PuerANKE+nqcXNjOUXd6htwaV9j9LjIszqzh67RIjDC5HSb/rojVA/f2OArME4M6Z6ns7G
	zdFMw6QEkjIh0M7C/BAawV0d8f9HjMMstzZpkiUETnl1Obsv3Zcv0wjZrq9PTnm6mBJpNN3WNcP
	6GN9uXzBo3KLHRpUzIqZViI5PUNr3sy1YGiVQNSoBhAVXM68i1J1g==
X-Received: by 2002:a17:907:d503:b0:c25:f7db:4bec with SMTP id a640c23a62f3a-c2a16597a38mr269720566b.18.1789743040987;
        Fri, 18 Sep 2026 07:50:40 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb46f0csm66329766b.32.2026.09.18.07.50.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:50:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 16:50:40 +0200
Message-Id: <DLIIYI1PL2MG.1UYJFILKBWBEJ@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: interconnect: OSM L3: Document
 Milos OSM L3 compatible
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Georgi Djakov"
 <djakov@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Sibi Sankar"
 <sibi.sankar@oss.qualcomm.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Alexander Koskovich"
 <akoskovich@pm.me>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20260717-milos-cpu-opp-v2-0-428813fafd52@fairphone.com>
 <20260717-milos-cpu-opp-v2-1-428813fafd52@fairphone.com>
In-Reply-To: <20260717-milos-cpu-opp-v2-1-428813fafd52@fairphone.com>

Hi Georgi,

On Fri Jul 17, 2026 at 3:33 PM CEST, Luca Weiss wrote:
> Document the OSM L3 found in the Qualcomm Milos SoC.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Could you please pick up this patch? Thanks a lot!

Regards
Luca

> ---
>  Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.y=
aml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> index 41b9f758bf8b..17690ff34489 100644
> --- a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> @@ -29,6 +29,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,eliza-epss-l3
> +              - qcom,milos-epss-l3
>                - qcom,sa8775p-epss-l3
>                - qcom,sc7280-epss-l3
>                - qcom,sc8280xp-epss-l3


