Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D23B3D6CA7
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 08:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787644921; cv=none; b=uZLFdu3Awau34Rw6iZn1TRL6lyGrpIbKu/hR0vTC0KGp6Obu6A6jttPpXPGmim8F5KE2zJU9rgrSlI0pbnaJgVbGNuXGTl7xJvLl2vlNSV5WyjD+YEUk9ku9WlK+nUpPvNwfqAF9ciShHv5o9Y/3e31TgP9me2nO1P7tUMT4KdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787644921; c=relaxed/simple;
	bh=od2LnbDdC6P6WWbmzkJe9cSTyda3C77kTQfvBWYLh7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=grvVaAwAlCyLu+pYQdlZqoiTrJqe6W+EJcgXPwe3vLNkSF3rb974Oc3Ifm+iLe81Lk5S3Bq+q1Sf6tLhajpCTAUkUkG338cOgRrd/BIasITfdfz8GCJRzH7Bk7uW7w7WUquQBy9yVFmC16Iw1IDagTFnuZ3wvUC/g03KE/Lai0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MOVFcQr0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g+JTsQGs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MOVFcQr0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g+JTsQGs"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2l7fo1220315
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 08:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/6HIy7kUH+TmKoAiCbJ0Yyg2
	JhsNJM+N6xF9dVvLv3o=; b=MOVFcQr0cdSdiJzfNhkwhnf8EQ6ZiwJv2nX1xgz+
	l0njcgt80kX7nosganm0WFlUkT9T93LWW0BrqI2jx0XuISHIyvNxnK+fIXGmqwQd
	ZIM6cPBw9tW51mmbXCLJJines6DbM8GC6zxnMcUT82tOnk75zFZPFqIu9XQ9lk5y
	Mba4wb5Wwu3i/xPXsbwxW/zXP4wOyS4SMxXaUc/PFDayGw7Z8Snzdv+vxZXKQOHl
	LgyGbXK/fYIs5o4EWTLmRD4HE7j7U21lEfv4OWeEWhjOpb9VB7FDGr2Mt0z1jlw2
	BAeqh0s+cMa5U3qbKpOUcOa8FavnkGE1Qd2GpjiXcSM2UQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g92jqs1v2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 08:01:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-526da7e3c9dso45064281cf.1
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 01:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787644914; x=1788249714; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/6HIy7kUH+TmKoAiCbJ0Yyg2JhsNJM+N6xF9dVvLv3o=;
        b=g+JTsQGsFIp8w1WAUQqCKLDAkN+QeMEH9DJn+6RTyPTZ6B5PmdjjPYwvdxyRQS9Vj6
         ScQy0rF9cb+2xPVOpb1EUUw7zuJXwKGMH0QT4AuqDScF5si+gXBchtHx5DKCWWX59UHA
         833mqJE5oiK21s+gSkpE2506QT5lBSj/UcAYJ6LuSlBLgsfMVz11SuF/w7O8AFHRv6g5
         JewhFNxs29ApqHfFvYqOK4cIf3ifFRZetT2W5Qwtl93LdZJ3ffVq8gIKUy3AmZabBoJp
         2pYCF/bPnzsB0nPk3sF+rd/EYzRRGzS96VIS3IQmD16p8TUZjmIkSgmXUNMzprhLcZiu
         q27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787644914; x=1788249714;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/6HIy7kUH+TmKoAiCbJ0Yyg2JhsNJM+N6xF9dVvLv3o=;
        b=JsVC4BpJS3yr/Y/QOmP48HlVb2jy+8tQ074vzvH8SKKmK8f4BNOgpNTepZS2ICtBkK
         A6h1YzyXcLe1b6KGpnvaK09wcI9KifGkrcEqpJ4LwCfFmYuIrv8XvhQnb0lhsJhqo/GP
         ccCARb4cVyk01s0nut/+hh4RrSzoymbvNxzy0jHd1DLtL4KhXxrhRm0T7w7P5+3qabvp
         mGBz/kvkMxZhvzuH8W2fK7pbxaoufNiH1QyPq7NPIpuXzwpuE3uG0kIXQnAGpHUrVCYK
         EKELqKRLUAmf3yfop9sTPtkiGUiIc6l1cSTaYO9QIx9nATxVi8lHW4el8BONzAZ30FUX
         gofQ==
X-Forwarded-Encrypted: i=1; AHgh+RqbThaDY0gGZgHkEe20cRxRtZeRqSLtzHTbycajQ8M9Lt5vHp4T85VcMM5Mh43IWFWIQiCbk9Xs2xBw@vger.kernel.org
X-Gm-Message-State: AFuF++mukHcGx0IglQFL1F3r67vpRLMqVXOf5PzXmhNExXoxtyrLp0RF
	O7kL2tFKl7pP/7XL3J7CHd59KOObn8Yl5AVnU4bo/okC/5ce1bFwsz1jPcucydFslqopexIJuB9
	/JkRaHR1qQwsNOcFXZIYqlO/x+xrdSUL5gknG9T4Ed5VxgSiK+70nsvvJPzSTqwSU
X-Gm-Gg: AR+sD102sGeFYIGFo3ExzXaWXEkN2S7Hqfylv4KjbjfuF+l9YKCfx/B3syot8V70cps
	u7VXvZF0LaL8aUzBaIqXgi79NgsW60Fhda1vYU4f5v8FM9ljcbKM7VbuxTbv/o7upCqcojo4pCy
	JsX7b9de0jGWwoiR975WDlQRVSU/lxdbx7JhjSByydjk47tbPmxpQkMw121S49lI8u+Oy2mG/xO
	FU4sDdls/ccdwmtgfmEF05CMOHS5u4ytkc/WB1lyh2jnH9cYqi5O84OKeB/N3jzQUEKqxIpGRf7
	zTgAWwuA5skV3tM3Q6kmCTgFEg4FtQIy6p6DpjouJR6JHg54cSsFciOyaFT/9qDJcCrbir7FBhE
	7274oEWHI32/ufw==
X-Received: by 2002:a05:622a:2587:b0:528:17d9:2d99 with SMTP id d75a77b69052e-52e09d05552mr253697791cf.43.1787644914162;
        Tue, 25 Aug 2026 01:01:54 -0700 (PDT)
X-Received: by 2002:a05:622a:2587:b0:528:17d9:2d99 with SMTP id d75a77b69052e-52e09d05552mr253696911cf.43.1787644913487;
        Tue, 25 Aug 2026 01:01:53 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606a8fasm1808170466b.8.2026.08.25.01.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 01:01:52 -0700 (PDT)
Date: Tue, 25 Aug 2026 11:01:49 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 01/47] dt-bindings: clock: qcom: gcc-sdm845: Add CX
 power domain
Message-ID: <ovlrngkv4yxzwgxdkvuvi6trj742yl3aht6ezns7ryafdi65sq@pvnlmfojiq66>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
 <20260824-qcom-tie-cx-to-gcc-v3-1-f1205a92682b@oss.qualcomm.com>
 <6d8b7fc0-9bd5-4bfa-97b0-a20bf01779c5@kernel.org>
 <qcvnb5nifvwtocgrlc5nddkwgakqjdrqj7uazplj5jpy7jmasu@o555nrglms2j>
 <14805eb9-964a-48e5-b6fa-b2616b52bc0c@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14805eb9-964a-48e5-b6fa-b2616b52bc0c@kernel.org>
X-Proofpoint-GUID: OEJDh_av8WkTN1TXIru_g5tkAMIw5p-L
X-Proofpoint-ORIG-GUID: OEJDh_av8WkTN1TXIru_g5tkAMIw5p-L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA2NyBTYWx0ZWRfX2pGThmasYgwX
 2mR81PANJIqIJVdwDxpqM6i9Uq4rxtvVQRic6oFSb+dK+ZT3pRVqJdPQHvDEHAKXsR3FIBZTtKo
 JOic/ysSlyC2mB5MsgfkYT/aZ4YrFGmbh3Z1TPPAZ7d/qmnYPZEa99WVNgbLwcke+2+JGrjBM2I
 5jd4/ZajUvs5j+wt8X8mVBu5VMP5IheqCyJsTqy/2XVTzGZb7kJhR4r6iYTf3g8DLqJX8gaKk+4
 N2Kjh3CHN20/R2voOpy8/WsZPFdsLN9FTSgwoha6j5UQXLBkM1baMy/GCLtfYFLqWCHuD3/Sh8f
 MoPT+2cPLKA1HkeVFbTNyLtgaoDsUc/rLLSAhglemuJC6RC2FtPdQU28Eh/OwpT23YDA9SHutM0
 bmfofZbVJj7Pns91npRl3u1jbISf9ywi//D9WhMzI5vuRVsVENgB8XTFdFiUcxNFb0/GCZSFyhZ
 SLI0ozHkgjgcr8FITsg==
X-Authority-Analysis: v=2.4 cv=JJULdcKb c=1 sm=1 tr=0 ts=6a8d4bf3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=JhlsCLWKGE4bq5yx_dUA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA2NyBTYWx0ZWRfXyrCBuJ5GuDhr
 CTNzHWPuC0lYy6/6Gfj6CDx85pO/D0ZxUXbra9+akvq8WKopJ6mJGY6AWqmP7QQ3DY08kqIxmNC
 wbgPKBJnyNsb+zcwbuU7cvejEC37a6s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250067

On 26-08-25 09:34:47, Krzysztof Kozlowski wrote:
> On 25/08/2026 09:30, Abel Vesa wrote:
> >>>  
> >>>  required:
> >>> @@ -56,6 +58,8 @@ allOf:
> >>>              - const: bi_tcxo
> >>>              - const: bi_tcxo_ao
> >>>              - const: sleep_clk
> >>> +      required:
> >>> +        - power-domains
> >>
> >> Why? Commit msg should tell me why you are changing ABI. It is actual
> >> ABI break without an explanation...
> > 
> > Actually, I should've kept the same commit message as for the other
> > bindings.
> > 
> > Thanks for reviewing.
> 
> The others only mention "to match hardware description" but that is poor
> reason for ABI break. If everything was working fine, thus domain is not
> really required, why would "matching the hardware description" matter?

An off-list discussion a while ago has concluded that GCC without CX as
PD could undervolt in some scenarios, as RPMh not adjusting
properly, due to consumers not voting on CX as they should.

Will add an explanation along those lines.

Thanks.
