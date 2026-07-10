Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B5140BCB3
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 10:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783679923; cv=pass; b=q2KSk+TMfq6aKfAiZn+FCwMNHAO32aMpSIYJW6KSZVttphrpxrdFJS3MV1POGLvLJAVfjZSdJFqY0C+aSIdfKXYOf/Ypwddn7jjzMEwZhOmqGWPOf0bhq5Xs5bRwSg1vW4Iu1pCIG54VQO0gGqcnTkZ2fAnQWdkycBKQajBmjGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783679923; c=relaxed/simple;
	bh=0KPxLWAyuoPTQ7fPlwfSGd3ACJr7sRxjD2WQTRY+LBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RYf/YbUNGXurHXCzbKwWuD9qjLc0KXGkCh/En9c3k8u8AuLhlpBiDFaXz1UaGMSDxmfeHnWrOfkNrSNL7CgLywOE9kEOTin+14Jk9iJlk+hJkh/KWlRnt0gzR5/pQ7i1puMnBlYuwERSy+fmebraoqZ1arBGd/gmsGeOnkU09io=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IyqJjgSp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HGNx0H2E; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IyqJjgSp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HGNx0H2E"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dVQ2235347
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 10:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hRx0YNaKKEWpX9l5PTuBp8n+5r7hIrtk3Mw3CiVS4eE=; b=IyqJjgSpCCQD+rpY
	f9EzMNXWEyBCQT31mMFOohB/sg9UwLFeR3OnotQs4BasxOiwspWHrZkO88TZAmA+
	w9b7S6ZpSALwOp6qKWInPx2NZK2ChEs6WHrUrCl2OiBZbpfZdPm5SAY/PcMoEzQi
	VVswgcbL0+Wa0/gwifY+lyZX3R9dPDpgKykMuxsBFRQhdqhn/tb1hWTFwxDbwqAi
	w+RKDsaGpl60OhrKxCzpNKOLwxMTFRFz05wF0mvUUxFcA+M7JnvytDNUqPve0LJ8
	IufItzKen8iNKihCZv81YLv4AjpKFbdupiQXZfhHRx6DxNk3N3mS8HoL3OrIQGXR
	h2tgZA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeg3m27u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 10:38:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e61b38eddso133938085a.2
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 03:38:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783679920; cv=none;
        d=google.com; s=arc-20260327;
        b=XNa+L/eIKukzklQRL6ZjW12vKxxWJ5GoA3jMYTzPmAHSWX1GQhnMiz8+bl4lDj/7kP
         ho7+kqwDyPS7U9injGs2slXxw8SfD1mvW3MISuA26O5o9x6yZ098EeoAb/V87WcgdS+E
         aK4BLOkZVVi1L9xIXlYYdiVKyfbphP7+X6DfjOj8MUqLpH9XHszyFeCniuF8hF+xhuy6
         YN7koDaIZak5iUjlvyf5oNzuL1IvgMdZ4YXW0NttDy2jrAXVmvv6/PPAWbJ4LcfDBpp9
         hFyekGOp0F5lb2ElEGotC5XsvPtmAdXst7Xfm1V0REvJ5Ki4l1TEmWovIb4ly4wIJcyR
         gvDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hRx0YNaKKEWpX9l5PTuBp8n+5r7hIrtk3Mw3CiVS4eE=;
        fh=MdDk5hgY9wKqvrh5FuvDaVeXC+Wj4q3Zjqnw1L/XKAc=;
        b=n4GCnHCWgCSnEbyFHleOtapBHp4jx8XAiSeE/w86fCOrvR2yMCDMxCiTYTV8C+lX/A
         dI8FVdj0QZN5t4ap0e2dhMvdg3XjVXn80+lVY6ynC+oiFvneBhODF90UEw+oeLGL9zaB
         f6Oz+IT2f7BoeNFJoKTmCeYt+lr3CdFd6KPix6KJSYuz/G+Zhaw2XEIfg3dBijqdwOzl
         sJu71V9Gi9qsx2QfG9o1jDIApV+6OMKFEZQX+BZUC0p2mMUT0NAdJCkQfExqWc2GRTPM
         dno0FeadCXB+XnGaR7p2nlJa/9j+4fwb1KpJNlotnfHrgjfoAklDth9e83FvpEPawZwS
         1HCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783679920; x=1784284720; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hRx0YNaKKEWpX9l5PTuBp8n+5r7hIrtk3Mw3CiVS4eE=;
        b=HGNx0H2EiSKRegbSOUN8Aa4Mp0Hb+onknAfKMpGjrvk4nsv8AAuTME5Tx9JkRGK09O
         LaXmA7k1LDZdVzw2fhn5HeYlDDXE4lO5nR8o+x5AvwrCPx4G2a4j5z4ifaJyBOGXqTin
         CIjZ2R4ZVP8AxBroUuqaDv8Hgm6rrgmhEEk8EXwgdSqUc4aXHjDn0iiwFjIyPyiprzVN
         m/RhBewFJQRXP9khTV4vVi6XCE+3IFAd61pVmood6ylBtf2wKv/BN1hxdlO+gC3zCpcG
         dbN59Sqc6XnlkinoZadDnuja3/4ZQHpN7Ern6BFTsTf+ZBTA2A8ahtJssQjotKKzOycz
         +QMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783679920; x=1784284720;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hRx0YNaKKEWpX9l5PTuBp8n+5r7hIrtk3Mw3CiVS4eE=;
        b=rVkHJJGwZFptnmwqO7C2gILmFaVJbOUHVVgYdm3a07GkhQ6fmMZNe4hYI59jAgwAeZ
         FE1/qXsoClu0UJ78I1lgbgF0Oj6sYmmvNaTxygIuzbGvPLEOrkJwKvJVvuICxxKKI4SG
         Q3BI372caSGJaozhVYSIV67kvNy2rfuIhtm1djCOyBEuXBFTSWLEyX/UScinzQ0hDHQy
         nIFvSnYEccD6HSfxaL91xhBG/EQAgka27Z4ukw26HzfeCKn/el3IRtFNLdMvw+G4ZgdI
         KbF0OrPbtX6JOk4EVtvGZk4h017PKsmhUfHid5hZ+5pIZmKS9YTHNsjcdVURLqELVlt0
         PUrQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqp3s7eZ0blzRDt+CTaZbrV/WZP/i5L/bC1PBFQmRHI0B56Zspk5DYAGDaX4tE3dJln3b5V5D1WkBRL@vger.kernel.org
X-Gm-Message-State: AOJu0YzjSL2cH5S6UCLq2EwVMHlKjR+TmxWmIDx3uFNepXwCe7v5X6HK
	p6oYUZ1QPn0KmlQQfINWarzloRE+fE68AjnpF9PBK8rtqR6ziejYJh76Y7XesG9yhnQe779dugP
	5fsUvAVEVO0MlBuO/mAyD+3bsUmbqdxLb3ImqPZplTJOAd79ky06UC1dDX1m2dosIuNsdZ1ZkTi
	1TVRWJcqlOzQ/GqXjWA4poth+VVYPKdqNLwhJlMOU=
X-Gm-Gg: AfdE7ckdCzaHRV93PolZM48hf7aGG5qpV3YEYsozjnTmaYw8IQoKJu9NuV0y9mn2uW2
	bvf36t7QOc6jnPKgLVpi5hCJXTMFzfRg525hks6pqc4T5lyFpxOS6U5xFztrrnyX5rAx4UBCHAw
	CnrUcav2qLVVBDBvFcHCMmqIR2cFeTcYhiLXA78XbXdgdQWEpPn8KAKYtu3TXtIgI/UQVrE6S/o
	tbzRjgrLMN3oD+cILVcrKpntbX2/wCYduOplOO8XqRaSMOo5f5Z7/PWzYvIeTIGx5+Tffci6/DQ
	o27IZ6IlXfs=
X-Received: by 2002:a05:620a:4495:b0:8bb:ac44:bd3c with SMTP id af79cd13be357-92ecf6aa99bmr1161315885a.52.1783679920219;
        Fri, 10 Jul 2026 03:38:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4495:b0:8bb:ac44:bd3c with SMTP id
 af79cd13be357-92ecf6aa99bmr1161313185a.52.1783679919854; Fri, 10 Jul 2026
 03:38:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
 <20260710-camss-isp-ope-v4-4-51207a0319d8@oss.qualcomm.com> <d5475ff0-1296-437a-89f4-1d3d6e9ac637@linaro.org>
In-Reply-To: <d5475ff0-1296-437a-89f4-1d3d6e9ac637@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 12:38:28 +0200
X-Gm-Features: AUfX_mxQ19n9pqr7NeXF_LyIWJF_S-APRtcHzPde7YNEtnh7-ASBQu7xsaFIcQs
Message-ID: <CAFEp6-1j=kA=3=wxWOrn_A_=Ugj-kgxRgKzN=a=3UsAef9YiTA@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEwNSBTYWx0ZWRfX/Y9ZLAPQzufc
 0m8CwMlZTzr7QGWqqs+nvr8T7YbdlWUo3H9aN3oU89DUbKpefWvuLgG7K56+wUv7UPclV6IF354
 X9mToi2Wzu2nZIg0NjNNpMrvmdgEV6bIJU8agkZ833mqBOthlVtFGdb2PBH3BgWjRrBSJmdeHFs
 nlmB4a6LnovMceUuFdKglzR56S4CK2mypZ7MTrn7XRsnM3235q0KeX7OIbhZeeaxz0eWBel1Wje
 r7e4bQQ2oGs0KSeOjhFNM8TLYPprW0xtXHmi80+HUWb2YHw1ImMLTbD2mlyXXQql8ROL/vPN1El
 dL2YcklJXZ98BsngPt2/rjNBFJInjdnqFbcFqaZ8kbQhOjGPdGjcA2A1m2tjW3yC1Bi3Pg/WoN0
 L9VhCz93HUoxviAJ1ptNf15d/ySfAY3pQY/hNUGVWr3P1bDjmrLTorziN3kzPqG4G//MVo88X3t
 dw3/SASA1kw3UX0tmUA==
X-Authority-Analysis: v=2.4 cv=ZcMt8MVA c=1 sm=1 tr=0 ts=6a50cbb1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8 a=mfUuqgtbHY_zyTLiPi0A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEwNSBTYWx0ZWRfX0eD9mDLzwPVM
 fasbAYdwAXQN6llTjPDwP2E77J3Rrb/NAOn+O/5+dqMaDFaz4xXrFbCyTSnC1iE9phQtcg+JiW9
 OHV2xUZL/Zz9iXFVldPODtLm8Ss0OjY=
X-Proofpoint-GUID: 3LSgWWC3tJ-kS8Jne6KeuLqRioBZ7fV5
X-Proofpoint-ORIG-GUID: 3LSgWWC3tJ-kS8Jne6KeuLqRioBZ7fV5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100105

On Fri, Jul 10, 2026 at 12:20=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 10/07/2026 10:04, Loic Poulain wrote:
> > +        reg =3D <0x5c42400 0x200>,
> > +              <0x5c42600 0x200>,
> > +              <0x5c42800 0x4400>,
> > +              <0x5c46c00 0x190>,
> > +              <0x5c46d90 0xa00>;
> > +        reg-names =3D "top", "qos", "pipeline",
> > +                    "bus_read", "bus_write";
> > +
>
> Does this register space cover the entire OPE i.e. where are the CDM
> registers ?
>
> We should map those upfront even if they are not included in your first
> drop, we map CDM regs in the IFE even when not used.

My initial thought, especially when we first moved to the CAMSS
subnode model, was that CDM would be represented as a separate node
and referenced from OPE through a phandle. However, CDM may not be
generic enough to justify that level of abstraction/complexity.
Therefore, I'll reintroduce the CDM resources here instead.

Thanks,
Loic

>
> Also, I looks as though you're missing CDM S1 SID entries in your iommu
> definition.
>
> ---
> bod
