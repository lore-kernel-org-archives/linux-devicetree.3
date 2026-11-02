Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793611714;
	b=oGmb1s9Ebe9Rb9n340QCKnbU1hd6ekcs/6Oz8cD3yFRgdRUcC7Igj74vpYXqP62c1L/1
	 4PWf47KZN3HWTixjlFbL8SU3F62JaTMnPBRJ18DhvP3ilyv9PwJOV0tkL/noGaGkjJFJe
	 Xx9ojCjpY+BNF+aqXB/WNPySp/1dcSg1vFRncrW/lL+BGiOppBBZv8KAxQJzulB/0dqAY
	 BiMbXhNKvZOMVZTQE6UhEk4RBZkRpp7g2n/bTQggagQXVh8izg6B6vOzixuRYn3NmzZUs
	 YeMQ/FtXc/yRMuDWZa/mWYGl2Jnz3brqDIHwjsMdi4x46aoBz85KWVVokAQAzuURXag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611714;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bcAaWAAo29UXjdHaM07h1b/3hAUH3Swdi0uO92w0ewI=;
	b=D8S8S24xMzlxthUuvUnptgNhShH+fRtBB584Siq7A2lMB24n3RgVBd5P/DQ7UrGxVoki
	 1xInOOZviUMhDr3xjg38FzayyaGItdhfDL2UqVFdPcwensqL1PuphAp8DoMCvhEh3cQ9I
	 LGHIQlEi+no89h9xKUKFNRmyEO7quUzZx9uKSzNpx99agr23jS0x2BeqfgmIRJstRfbd+
	 ZetjZzeBhEwwFXABgPThAurPv/O+U+tmaPcg6vB9WikSXg5QfrkVxuDUcY+AgPD2hrKbl
	 CCEvc3oEI34jlMFur4Na5yq5xUsK9mNubOfkRhC0iadF10WVfkiGM1OGayYtwJNG8Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X8s1xPRn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MiSGGqkS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D60606A326
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 09:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75D60606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X8s1xPRn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MiSGGqkS
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29B1C24015002
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 09:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bcAaWAAo29U
	XjdHaM07h1b/3hAUH3Swdi0uO92w0ewI=; b=X8s1xPRnEUjh4VACQths5mr/jZ2
	+M5KMt5X812eVjoFa/aQIybk9po3wOmN9U/JFiupJ6T4YpD+BO942o4fIzRrIXe7
	GdRNCPNNlh36tULSxUBT499UEhDW9wYY76rpssIf0kyu1NT37P3lcFiiphBFQb29
	i8gnTKw+9TGxDjFWdgTlKkj/M94y0GEK0eq2sscr5vgrUqNBdBU/UP8OaKqZQcPP
	3Y0n4bTpSPXG+lZybYWNpT1YCGDvOeaNoOXnN4WXhx3PZuCrLan673vYDD9x50AW
	Oq5NvkosY2y2YaBC/FlCowXtfyYaQXEEcBYvc/HOJCaa+ICC6bFlLpG9vOw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6payh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 09:28:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf6c528aso398808885a.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 01:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793611711; x=1794216511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bcAaWAAo29UXjdHaM07h1b/3hAUH3Swdi0uO92w0ewI=;
        b=MiSGGqkSz9AEyjV3CJaEdqDY7lsUnjqeiSRsy1pleKRHLjayB3n891m3RrK3zeKWkM
         LtC1WoKTLK5xI7JlF8yv+X2ACYi5nlIl5LOBZuvIUPnO9PzlNIFfRkQag7frKNuR0vIC
         Ro2fetpdvcNTNbqG63hDx44uO94gdM8IA6EXeKKEc4EnmZMyl1Su2iT10id0BF8vmCpz
         zt+6An8I6v1/su46hDJ+FOoSN++YHQzi7N3FQgMtZMM2sYHfjtgUEKv8fGd2LqdFZdET
         Kdarvlr3aqUiUgm2Ia/F6JjwSxotvkCyjWywXPT4RTmZUYOtC9CYJ82FjY1UF7/szyXU
         0hqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793611711; x=1794216511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bcAaWAAo29UXjdHaM07h1b/3hAUH3Swdi0uO92w0ewI=;
        b=hfgmTFLNMIgAZ6DJFzjPSzYtEUDOT4BBOlaDzJGLry1+pHXPtVdRyx10sW3WQXm1Qa
         2PTqk0pYueEsyjZCY3F+rzCMgbxKGJJv2Uv3b4PaGKoNfdbsXSGLMfJwe8xwKtmGYPkK
         PKCUJHg2htEJa4/JrlaBXLSs0igvvAT0NU+3EoNQtZGu1+84a0ZtalHGy2Xg2EKNQxm8
         pz08p+wKIPvKXrXQmDrS+CIj6QaFgOeLKoDsf+FL6Yf9WdN7ZK4LQPvlftDg08Ha5YZH
         9/Uf2/iUmm8bAObPdOOnyJRm5waV/JtxgwBF+UCgxClI8sP6qu9bbxCL2YZ9F3CyicO/
         qS1w==
X-Forwarded-Encrypted: i=1; AKwUvBy0icBrdJe6jfQOFQx7QLlYpXfJaMV5FYCo3kKlO6736KN9V6DoAOcSPooLRm1zyLoW5fqbXEVmqXD4@vger.kernel.org
X-Gm-Message-State: AFq9FYI5Dmu6f+a2TOA+z44IhUFSI6rKjuDLgKP+OTq8CBhJ2NBlmIei
	GYKXR5N46WLTIrMtwy+nqCmdj8jaES8B2ysAaybv3nUbCk/DBjvkCbOk14XOih6JZCfG4067WXN
	13i40vdr5L0zFejPLsbgOuJX9vFqgr1WXozVRIg+0KfGvX+j4QYBq3/Hun8BaBTvF
X-Gm-Gg: AYBFou0uyyUosKVaEi11FeUnZkqIKRrlGmDOlVg079xo6oYOzyEa6bbklw7aYKh7FR0
	cCbNMofGXcRDnJDApsC82bkGlPLyrMd3wf3r2ws8z56RZKIuRWqWnP5LAfySrdwlOgUXmjfFPeL
	C+66RAZMYfVvKosto2uu1HS66jmeoY6GMs4fnf3eMdX4sJkmcEzyaxm5MT0geg+Ow5M9CqrKJVO
	yJWj5tDaxJZYJoIwngb0+xkhsbL8m30K52EsmlPvfEJZgW6po2MM1YQekwrSMcvCSx/BRB3xCNg
	WLyx2lWfDysGnegsI4gQQrPh5+yNeJ78lSpYInB+J0cLTnbwE+993w0VENm8LmnkF/MtQT7qobv
	eyyiaWmc7DCGPCI7pFj8ehcJHvoj3pgzczJJ7mHTWw1QYlolNUR9jkv/wkIE4jnavp2xUu23/0g
	==
X-Received: by 2002:a05:620a:3188:b0:93f:2ab9:728c with SMTP id af79cd13be357-94421758732mr1585045385a.71.1793611711556;
        Mon, 02 Nov 2026 01:28:31 -0800 (PST)
X-Received: by 2002:a05:620a:3188:b0:93f:2ab9:728c with SMTP id af79cd13be357-94421758732mr1585041585a.71.1793611710931;
        Mon, 02 Nov 2026 01:28:30 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d5dfsm22171893f8f.3.2026.11.02.01.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:28:29 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: atanas.filipov@oss.qualcomm.com,
        "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sm8250: Add JPEG encoder node
Date: Mon,  2 Nov 2026 11:28:28 +0200
Message-Id: <20261102092828.3728247-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <4f7tyzvt2ojfmkneoaviegk3xbt2gegp3yoei57rzijcxkrlyp@b32nycxqybyj>
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com> <20260730150524.2659577-4-atanas.filipov@oss.qualcomm.com> <ln6tr2vwv6zmoo3kcivjjf3rqjxqm2fltwcpn4kk3iphc4rzlb@qdpop32fjm5l> <ce631db2-8e8b-4b97-8164-c701a1b0dc1c@oss.qualcomm.com> <2rtrk7tsquxekqhk7tsiomjnfzc3xfqg574cbw2m5b4ui4ovt6@2oxme5w4wsqy> <31db3de6-34a2-4ccb-af61-043f56d8f86b@oss.qualcomm.com> <4f7tyzvt2ojfmkneoaviegk3xbt2gegp3yoei57rzijcxkrlyp@b32nycxqybyj>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5BsgEuzTfqMTvCHPetiMkR9DfNOT0Jdp
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae857c0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=MqBAt_2VOQeXeQd1tQ8A:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 5BsgEuzTfqMTvCHPetiMkR9DfNOT0Jdp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNyBTYWx0ZWRfXxvSRHTA46od1
 QTrm4n2ZCp4VZl/aTx+d36rkHa+nIgtJWJM4OSlA890bgqNYdCRWD3BQgbaH7pFZWxrSCKd1SMN
 PUXG9ZvxPkCaMuQdxsg+c8CLig6XboE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNyBTYWx0ZWRfX+LsTpBZZW7RJ
 uv4Q80JZmm+VN/BSFYrvELMT3KT0iS/UUHc3CHW++A0J2rlLIG+Iu8x6/a4wBi2YnjavC2BxmlE
 L0f1ehlyRBTI4hLL0uWCHg0hiZCrGNQgy4TLDauswsOp7gw3gIQtJjyY7PawlGguod/tQtH1A6z
 qZ+q9Em18TdBuk1YP1I7+OY8sxHq35JTFuquRUw2VqrTGgMOyQmdLQlw3Svud9srfWzDHVIwxvM
 FiUCRAQcxB3SFiYeQ9YHmLMG5v08iDwP9rTF/n4vWKkZR5gfTrFupZv3D7BvIZtzOvGvNVeW0IO
 t+jLkCF1P/dooGwjvI/brnRL73YMRjYS5zqyOyg43ulBbthMd68tFxVjbkiKHDJYYIThHPal3EG
 4OJJSQrbWeSYVdHWNyVaBjZsT+SqWmS/5iVqgtRccZBFa3L+LH0mVvoChiZqzvAfGJUe2UZTGGo
 rHuAf0cCUKCHxFCIw2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020037

On Fri, Aug 21, 2026 at 12:36:26AM +0300, Dmitry Baryshkov wrote:
> This will be true if:
> - MMCX is a parent of the TITAN_TOP_GDSC (in Linux kernel)
> - the driver casts the vote on the TITAN_TOP_GDSC using the opp tables.

Both hold for v7:

 - camcc-sm8250 attaches MMCX and registers TITAN_TOP_GDSC as its
   subdomain, so a performance state set on TITAN_TOP_GDSC reaches
   MMCX unchanged.
 - v7 adds required-opps to every JPEG OPP entry (min_svs to turbo),
   so dev_pm_opp_set_rate() votes the MMCX level through the single
   TITAN_TOP_GDSC power domain.

> Checking the 4.19 kernel. cam_cc_jpeg_clk_src casts votes on the vdd_mm
> (MMCX) power domain, while its parents (pll0, pll2) cast votes on
> vdd_mx (MX) power domain. Note, that frequencies used by those clocks do
> not match, so we need separate entries at each of the corners.

Agreed that the PLLs need MX. Upstream nothing votes MX for them
today: the camcc-sm8250 binding and DT describe MMCX only, and the
rpmhpd MMCX domain on SM8250 has no MX parent. On SM8450 and later
the camcc node carries MXC next to MMCX.

Since MX feeds the camcc PLLs, which every camera consumer shares, I
think that vote belongs to the camcc-sm8250 clock controller rather
than to the jpeg-encoder node, so v7 keeps TITAN_TOP_GDSC as the only
power domain of the JPEG node. Does that work for you?

--
Best regards,
Atanas
