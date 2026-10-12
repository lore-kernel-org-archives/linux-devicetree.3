Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03694398F1
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787567; cv=pass; b=ls2GMxt7u8wISJeqzmG/xwsjdaVA6awBBksa6fsnNQJ1LkTOcI9i9+1kJIzbNCUs+80mOIwf3s6sMI835Q2WCZEE9laKahtSaD3MWxbcGCP5xLQAptbv7lSwr3/YvFu4I+LaYOQKNvOv+2YaOPKxrkTttTpXZyxz4PORphlGYJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787567; c=relaxed/simple;
	bh=mN+1knXYNtngeeWJgfNsIN5o5VTXNif7Wc+A2lc9JBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XgNqL0nYj7K7lSx0Y6pX6k0uzkxqiCwrWLnylqHO8/NfzsTmSwncU+wobFVBtq8UtIJ4nCuVL7nRYt8MKZvWMUZIog72LNcGTLIssYshpWq2hy+a0qLKxcx0+8Z0flSgzlseQInUGyPB5hF1nkC3ic1bavG74PlRmV8BsWdMNFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iMmL+GZe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PneTYvbY; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iMmL+GZe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PneTYvbY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55o2Z1339375
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=05mRSC4SMhgre7tJEuCkEGqI
	JCIZwKO88R6uiRwMZ10=; b=iMmL+GZetnGmQafs0KDkpH6OunxOR3dffjKLwsE1
	H98384Mww4/3NHhmaI0uIR2UShGlGnUnF6LGuLtIVXy7FZmdeM2qQkdbhR9DBbsg
	Ic2C6HaC6jzhbQP+S3/SIJPn3u9Tmtdd7sTrLf3+5TAxRbHz6QHRUcf/KxKXrG7l
	p1EzyjfYSXhb5OHwoeK+hVDozz0R0vO2CpoxsZHtQa9UF2HQkFctg0CozUNHuKhh
	2kS0cg2KGKN9r/Lfu6QWDoLfoYo+uMNlxgEKt918g17LA/h5dYKKd6gzaXGQWNCL
	PNQtD2M1756pYb7dd6PRYkI+DG0UuAOky0Rzg+J2ereueQ==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7dk2571s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:46:05 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-836c416b236so19801667b3.0
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 23:46:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791787564; cv=none;
        d=google.com; s=arc-20260327;
        b=TbvFkS9mz9EBufWXZHU3sEK06YpMHkvq9qJqfbs2fpSueUqXA/6+zAhvOq5oFK7CAa
         robAEdX0S7/UtsPtWAn0HWG2J36plTwYTWqyEh+ogMNVdgRx/KUg4qczflGXPqyWol6T
         gzir+dszw/8Wz9Q1D8X9z/wPwpEUdiH+cyNGhjBlnBWhRwGU0W+YBR6lvDfslt9wwDWm
         LA6V15nPISlfQmxnet+jIS/zt4NMw0NZd0kTIjrvoAu7vf2JgZJtyNrVsnf/5mcYrZb5
         IJgpL2/KOjF7d4x26ekhBVYzbKeLvdMHpBlRs05BjZro2E4OvACb1fqhM1k5x68GrAMX
         QlKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=05mRSC4SMhgre7tJEuCkEGqIJCIZwKO88R6uiRwMZ10=;
        fh=1Im48Xj9JQfGa7ES/Lm42qOn8kdtgeEMRKSbAngc+Qc=;
        b=CRNrySwAi1NvhqGz4cLi0Icp0Z0kT/UbJn9Vixva28laxs8EBchDvUs55Z6BcBzCqM
         EVYhkTErYoLV5HW+fGARPtuvfU50rKjTx9wp4/yna9uoA7LknZ7TvliBTzYdubAhwUxG
         pVVfGIsRbIpFsfFTlMH1OgFOo8nvaPlCpWlDZcHaREPx8Nw+OHwS4/2gpgfq5k1y5DLb
         I3k0oj5wh8zzAqn43NZhYrCzUozNoAShQwG1pAD8lgkzXpoywDoGCoq92DuTfEwvVX3e
         fQC6ZUeP49VQ5rdHJTLKhwZDo/+h5xp7vxW0AdWQxgnlm1tFIKnzX9PoK5J2/YBdITLI
         ym/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791787564; x=1792392364; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=05mRSC4SMhgre7tJEuCkEGqIJCIZwKO88R6uiRwMZ10=;
        b=PneTYvbYu+0tJEmuwhtylgHOAaNmDcToMIweu3O5qBBCNfXdy6uEBCZphu0KvIPTtt
         pi4MOSfS/ImMoSAHj+0F9qYp9+MMo1DAnHCHOxBdg9YPsaDAzIqCxyuPYZlqqbJlzDeT
         rPfaU2tKP3ecbxOABzq9QybqoHPISidnwJ0kTKF9HVmMszbU5V9/UBdGqLM0CtAlA6jv
         oltir6Wp0TNfFhrQ97u99SbiN77eje6K46oUCd+H03WUBwnLxA2fM2hacEnpWqoftzVp
         pNKqQCdueP5hWehLtU5K2uVq25c3ZVgyg0UwT6oB/ciwKPRHgBqqF3ItjbyWsbLSyqsv
         Chdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791787564; x=1792392364;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=05mRSC4SMhgre7tJEuCkEGqIJCIZwKO88R6uiRwMZ10=;
        b=cTpXY7xug9uihykxQOW9TKHs5SPwamXB1Y/gHi/ymuYDzxtJzKIUNJUzXc0JMPwswI
         dpR2mVb6AkBhpbWio92S3KO+G5Jka9QEJsD62H1k6hjNax+m1h6lr/qFNe1Q3v/Q6gGJ
         r+m/lXx4RNqOM4qxX/2nxXbartMo4uV/uqIYX2gXEQbdJKtYR8xRobNbWJN40WWWXvfM
         OdmTVPZIlAOU4rV5tLaJ2GM4lnsmlrx7/b1ML7l2b/xyUAbc7IBvCuqcRmYHgCgFqT4N
         WIKC7kV8LNRoH1mKF9OK70G2WhV5SdLu4iWOpCHWAyfcKCz+ujDMV7mof9cLakA1xGra
         9RoQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRzuN9AuVQ8hPtae18bhgkchgZJvZxYV3p1lJJqB2hD8NjOxWHjty+NKbHbKLXIWBnqqF/aCgQA3Ae@vger.kernel.org
X-Gm-Message-State: AFq9FYJA/idtLuWw8LF0gvKXvbYfko1YGBXD4F0SITYPC/f/rhNP2XfN
	1w0RGZU5PMcpbMw1CUVkb9zPMw6EvTg8y0pqcmcTyKp5dE5tpGkUWzi+Y325sOGxsK5gbFIsLbO
	paflTd1djrCEsV/rFV7r7f1h0Yi1/JHJTckt8tSucC4A+76eGSoCPFM88G2NKFwzDLAi4WIO71k
	+I5A/TRlZvtcdZ1LikWsr4bYouBHA9A+MUG/ORXDc=
X-Gm-Gg: AYBFou0M25n4FyYPsPCyuCpE9MC2AikLWewK+QLfTu17bKGR3ZXVExr8MdyMrY9Em8/
	NrD4s/QzBoVs77rpv0hEWO2YcfIABW4Z7JJTVpXJNZJDxQSGPffJCJneqzwgTxWycX3W113p2NM
	ChbnRIGlmsCtkVlG1fT5Hqqj41IYSivfBgFzzwanvrriC4ptyYJmW3B2l6Lzk=
X-Received: by 2002:a05:690c:6987:b0:8b0:a1d3:3823 with SMTP id 00721157ae682-8b0a1d35c71mr7405027b3.24.1791787564362;
        Sun, 11 Oct 2026 23:46:04 -0700 (PDT)
X-Received: by 2002:a05:690c:6987:b0:8b0:a1d3:3823 with SMTP id
 00721157ae682-8b0a1d35c71mr7404927b3.24.1791787563981; Sun, 11 Oct 2026
 23:46:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-b4-qaif-shikra-audio-v8-0-ac618057fe85@oss.qualcomm.com>
 <20260928-b4-qaif-shikra-audio-v8-1-ac618057fe85@oss.qualcomm.com> <20261006141620.GA1950759-robh@kernel.org>
In-Reply-To: <20261006141620.GA1950759-robh@kernel.org>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 12:15:52 +0530
X-Gm-Features: AclHuK_Pj0noF1c11z_Dxs3SIV9mM7Suyi8CwWbvl8dTMFkFuJ253BEfSkuBVG4
Message-ID: <CAC-tS8DzW88Lu_k-yKQtyfYc8u5-rh9WKTSanJ6dq6Xo3wp+kQ@mail.gmail.com>
Subject: Re: [PATCH v8 01/10] ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add binding
To: Rob Herring <robh@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: _09uSx-qi1wgWOc9iVxnsS6QdnD5pkrt
X-Proofpoint-GUID: _09uSx-qi1wgWOc9iVxnsS6QdnD5pkrt
X-Authority-Analysis: v=2.4 cv=E6hYNqdl c=1 sm=1 tr=0 ts=6acc822d cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=IkqFnPuR7rtTU04AMzUA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX/eOlZ8QixCsx
 Xj9hlJW/GPYtmjbui3GPDkel84O/fbhp+ngiUcT0E7x44lteGxG0sY1DzefyPjpwrqRE4HHqBDD
 nJ3sNROr3rp6L7J62lWDVeD3E2KqHY5qQx9VUkFbjLfbksd+wCYWfprNuGuSDKTk+FdICjEPDJo
 sjzU7JmnEKFUNmF0Tkd/C/+xBdClxXuzNtjsdl+lWBKHKOMWX/wAMoZaM5/qVyOv10yHdrD2N8P
 ry9ONze68iSResecVOaMtbgXUJwplyR74wWplS1XjSe/27H069DDLcqxtx+4CZNMLMwN1/eLR+T
 ZE6Z2ZjM+HfWTsD3mCaVY6Z/11FDiItEpuYvb4Lv2qEb5CfNZiKNptbVR32MeneUrR34rtMuQIK
 rGiOeQGSVfTgHTMukp07jv91iqW8vGN6OdHwJnJ18d5+fIRdCc35PUgHkoEqU8J86ZTuL99ZSl3
 0xDQNPsJKFBEmQKLN+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX4RI7D+r0zBij
 LJb7QFtkLOcIkzDyglfV/lVTH4iOYuiyIut1Ve+cqO9FrdmndfeFg+O9SOP8kDNOW6SAbML77Mb
 xByCEO6AOvFlhSY/us2tfFQlPHhufyg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120026

> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: QAIF core registers
>
> Drop the description.
Will drop in the next version.

> > +
> > +  iommus:
> > +    maxItems: 1
> > +    description: Phandle to apps_smmu node with sid mask
>
> Drop. The exact provider is outside the scope of this binding.
Will drop in the next version.

> > +      dai-tdm-slot-tx-mask:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
>
> These are all common properties. Don't redefine the type. You need to
> reference the common schema (at the object/node level, not per
> property).
Will update in the next version.


> > +
> > +      qcom,qaif-aif-lane-map:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        description:
> > +          Per-lane direction map, one entry per lane starting from lane 0.
> > +          Use 0 for TX (output/speaker) and 1 for RX (input/mic).
> > +        minItems: 1
> > +        maxItems: 8
> > +        items:
> > +          enum: [0, 1]
>
> Can't you use a single uint32 bit mask for this?
Here intention to keep this consistent with the other tdm mask array properties.
-Harendra
>
> Rob
