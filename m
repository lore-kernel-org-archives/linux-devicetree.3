Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342ED3E49DB
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371704; cv=none; b=mb3NuMLnMsonax92INeErAkaRa8lRfeU5iKKnRX52FtYC7kRKf8y03VjYUyTCHbQBIeKxw/LaqZljirhBgnDhEtT4cf0yCcv3wlHzoW+sq3m3u1AMZUXC1KCFwspWzQjqytFFMocp3QL7ipHxC3OSVU4U58SAq8OXPrid5RWXik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371704; c=relaxed/simple;
	bh=Ws9u3/CWwGjM80rr0l9Bq2F3GBfaiOwW9ZLAaSwD8bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JwPdKrGdBanc9u4NSI87Iv14g22UvHYOeCvt9xp8xXeW805lIrED2IQZYppwHL7VSR+OWzGRnxYD/dpRi0teBcy+yNHtWrqJ7SCZPvkW5uQooEDzEeSHOWbkF7Ar0sMhf1pEr/+RkF8n37hJgmAljuCGy6PmrUyM6QZbtgFpKzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k1FIWYpq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=arjCITed; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k1FIWYpq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="arjCITed"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jKI83842723
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iq1F7tQsXtHe21R/reAaPCE5
	BzLGvftOFHOFXiCbkNg=; b=k1FIWYpqSjYYjzh5270bSYMMFxigGYJ6u3RvEoDs
	APMn7qEfGT5MUWlFwI+E3OcuhajFT4p22oa4jjdAuzB8DZz6VbIJbJswpTt76rtI
	HggKKkmNnvKFcBXSIjNh7AB1cgPJ0MDuWEjG/+Y1GQR/008LLiUbiaK/WXu9h7qR
	t85f7KNuro19ijCONAcrlb/g3xh+bcuxyKn7aDAC2TqgrCWhR0IYhlf1Z+i6deuE
	wUHtyIJMabLPiTjfLhKCOZorzhl95vleT3Ea3/FK9Kk+m7DPx2z29FoJ9APwZIHc
	ta/KKXT91jRL7lnocyiQw22hmjPSsnQPV4wZtcrGsAnwCw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c5k1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:41:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a1de6d5c3so183530285a.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371701; x=1789976501; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iq1F7tQsXtHe21R/reAaPCE5BzLGvftOFHOFXiCbkNg=;
        b=arjCITed6+vzLC3iQKer509/aU1bue2ztmeSnMrC8tQZ6+fg7K4uAqDQsIP/i3YsE2
         dx2vzdjkeRVnsRnuDxSJzbBoyQCHt0dkjOrqHn1pazdYm7XyZF6DuOOavNuh7vAbUWOR
         1xLncT8yttgSoT9JsFrChI11UBo7Sdo6M5JxXIhwPWPhpp7x1iQxRbcwnWeskinaY9PR
         r2L6WyqVkm/smYQ7nQd6RcCuEiXVd+3GJgpCb3PbdlA3uM6ALv4VhXI5/G4k7NjFhS/s
         omD0hLLtU2dxkAIrHV45heyswSGpzPfPlcDC2cm0Cupd+Xy/o9u9eXmtugdBAVSC2z8P
         2UXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371701; x=1789976501;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iq1F7tQsXtHe21R/reAaPCE5BzLGvftOFHOFXiCbkNg=;
        b=DgwWz8T1Mb/oSKaFEeWvt9/Qu1r1/kYyxTtIpFx2eKaG/N/La84pIMhsX7TSxBChv3
         3sM9sIBklIm40cR6KGez9FLfHczesNp0jDunnQ/Wn7v4Fkj6RAQSqZaXIDsiw0+47x7u
         J+uhW+bJKaMBHB5tI4Za4shV0VJZcieIXiQ2qVIU9MJdTw6+SXL+ZVSLKJHOJt0jyD5b
         64s56c9r8KTLS+BbMcXVTp9MfILYi4YwSzjQOAChywuQ7+f/O5TEDl2r9FTfDLzqCbBg
         oO+K1P1Om4BD8NZDUI7rR8ZHev8Z4ksawDSjU0KfGQaA0yaBJ0PM8foQayjnnkPjtUch
         F5mg==
X-Forwarded-Encrypted: i=1; AKwUvByxw8b7ANZ1W+s9TlBiYCG2TxfS1MRMCRj38NKoPXjE3vADH9CvU2IV23ExfgJQ0I3v86oIbrzqvDlY@vger.kernel.org
X-Gm-Message-State: AFuF++mkjBUxIq5rAZSjzN6CWhR3d728YOdlacphDrHHrEjNyJJdsMXA
	0Ogtw5FfzRTb3KOWQVnLHtC4mSN8owlRnmJORLih5sQC7XpUaH+Pniyn3TO5ZlsuZtsoRLqM+Ri
	8aV4+RLPqennpcctM/1equoLfINxx/5xSieZ/OhY7bEawgGKLWTv7MEuezb2u8yqe
X-Gm-Gg: AYBFou1jp/7lyymz8qCGjZmnNzQZNKE9XslBdTt7nO/rUi4hg92ITudWp8753E8Ra+K
	xTuXAZFrjZr9+R6mAMh2jna3h0nst0qJpGsfl5WK+iGSj9LYDygB3eBqrDFYxhMcUDa7N5iJVFC
	+9oQijbIwxjEoxj2k26G9uNViZgaW706uczCcN/iUfzFtKqlYwCsebPQqt8U7z+YCIxmFTZnLz7
	/V0rE+8Tj+2u4i0xAJKcmnYFWAGWKGiET1d4bN8EWvRrtEJiBqpsZHoxGUqadair9HV8tsG3j1w
	YHxJeUbYwxN88BQZ7u371q1012xfoI3p3CEgLQjjXy5xRLeiyVZtC9sy8Ka13o1UYULqjkJhfrT
	ooQw0RmBO963hSg==
X-Received: by 2002:a05:620a:1983:b0:939:a0bd:2c95 with SMTP id af79cd13be357-93a2973f678mr187346585a.4.1789371701381;
        Mon, 14 Sep 2026 00:41:41 -0700 (PDT)
X-Received: by 2002:a05:620a:1983:b0:939:a0bd:2c95 with SMTP id af79cd13be357-93a2973f678mr187343885a.4.1789371700920;
        Mon, 14 Sep 2026 00:41:40 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7723d458sm93064255e9.0.2026.09.14.00.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:41:39 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:41:38 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 22/31] arm64: dts: qcom: monaco: Add domain idle state
 names
Message-ID: <3enm25celxcu3zzitfuiz2p7fo4f2b75jcpzg6y46z4fx2tutr@pbipgojr6ehw>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-22-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-22-660c31187819@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: bcYSZmlR9CFkVZGtZCF1D3S5R9g0Me7-
X-Proofpoint-GUID: bcYSZmlR9CFkVZGtZCF1D3S5R9g0Me7-
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7a535 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX638K87x1yCoY
 AlF13NzPlb4rmDdKkpFew8+D6tslTkDhbfmbkfDknLDvFM623MmAwS6Np2TUmRuPlxVQ3BssPmQ
 kjLjeLzqWddPXn6Y4iAlOabIj4N+GoH+Bb/94qNmLAvC017RV1a0IV+WILDrWIjDvJp4gjgvcVu
 W20RRG0D0rDTOzmDgqUL7c1is3LxmdTz60nYqHyzNVEnTs+VaSOT6NzKCafXXMP4M0AnmZ/8+WF
 B+4UfXmcnpNTWfwYnTq6LP6pOT3z3P2obcNn8awHYlrQZLIVKSlW0K0xiNiNQUuxHuE7tSXdzHr
 Daa1phRkUNpbB7Zgp+Wo7WMGwwRwaCXEyQT3HDg8gadBMpcorQXgW0HBzPWcsL4dn80DETI0gmm
 yvwyVi/gJ+PMH03LilTcoazJ8hUxHN/ymbrGSAxtIx4MgJP7Wwdvsf/d1DUooHeMcnzUIk+Kr3W
 AU9Vv0W5hGtBwG3tGJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX2qGs7NTPYJll
 UgjCrR+R/r3uYdcKf2RtozrWvjhj9A7i6r9Mq8ES23Pxbjn2dvxRHy0O7lMY9paLpey4XX+hw6O
 SD3TuuOvEfCkcWKcVmcYLQgJe6qFKCo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140108

On 26-09-14 12:29:54, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
