Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A103C061A
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 06:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774594306; cv=none; b=IvyTnzTnIAq1E+4FbuwTBOPx1CxAwhiVtXnYT0AoOy2Bf5wfjCvJCCKHSNOPAl4bsLJXeGXi7tWo5bWfOFs3aj1UOXiFG5pxxpno64/wG+SWpH3WpY89V2/hLCjw2tvXpiAwsy2RfuZnZyfB3R6T15D7ouwTUYtV2L8vXokg7e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774594306; c=relaxed/simple;
	bh=OS7yLQyUaObsM2aHvRt/ope03bw3F9NevPqDTMN3HAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GHR0cglVoTNEsVoIinbLjtgbZi0ivlY966g/PJ6RbbjITnuqGifutCBUppnMhEqJufwBL55rQ/LHfB8Yt3AXPRv1Xqte05aZS3xpMrEmEhGVS+qLTN5vhu8xACMyRyjyFtuJPwqnoR5RQ8b9xy/N/dwkgLheCho7n8NbWrfbWao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S77P7EaD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gFPpNHVc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S77P7EaD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gFPpNHVc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6RaYc1682009
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 06:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d4QDO8rjrXrtrdShBELqR+QjKoF+6g6XHZKBC03PRd8=; b=S77P7EaDKjTPo+9/
	BgPKDJ3SybOe58RyGDjWzeI7gbRY5cwTd0jOoYfu68g9Qn5UZLerqhWlvGUWTsOx
	tS80vzik7llNxGKUkmw+vYruYgQVAVBSqxuKXXWaq3x+9syJ7j8M9dUYwj+gHkXW
	Z627XCUvnxGZKSWjDcLemU6GaQGQ0WexZVH3KjMn1lbPyRokswQYMPEDXu6UpkIX
	u8MOFU24QX/2O7hMEJZSns9EC6VnzBYTm0mRTVPYKJh+nUf0oIfNi4LxpwSXFu6O
	zXFy6BAWcdpmTokPASnEnV6mq/t8cNYiHDEincU//eolvRH2XwuM3D/bD62MFNzQ
	znqnvw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5mn102km-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 06:51:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b0be75dfd4so25057025ad.1
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 23:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774594295; x=1775199095; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d4QDO8rjrXrtrdShBELqR+QjKoF+6g6XHZKBC03PRd8=;
        b=gFPpNHVcZpIcphEo0kZ3Q4+wq4cYKUcCGu8qeaLwQr1+ftsZd5yhuS8rf6juL5VvqY
         ZlbKGG9ypyBoHHOkByvg50U/qdUgsCFGHLdHrR78DtuVbx0Y6doiNwSzs0+cc3/pNaHL
         a+/6Os8v37L3WEmWnudAAwMQe3iaaRYXWepAGj+gzgyBTCjf3HuK/VHkWDLJb8FNqi8Q
         F5AjYSrpJtwhBS6S0F6kG+gMQxuBuK71+jWT+uVf2Fo2HCQenF9/jO+LJFxBR6vh6eGI
         0Q85b38Hcj6qbH1O1fhi1/dDETDG+VfPxMy7htM1m1c22Y8KU/0wMCrDF9GR4nLOrD0Z
         JTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774594295; x=1775199095;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d4QDO8rjrXrtrdShBELqR+QjKoF+6g6XHZKBC03PRd8=;
        b=bUVdlnIXQIJzpQrUZ8o49W8YhoS6ym3qVdSTnM0cDWjGar/HxXxX7jrFAUgtUbbYGu
         BmS2q7NOuxbnzN66cgBw4++LJaL0xG2W+7KEIsQsg5xOrZoPZG11/bDxWitfIl0Ob9xZ
         CUMoFmy+ycjKxl3qApuoj1Wwohr9tOCTFPw+iuSOyZ/aB777hpsqLpusAJ3TomStQPdp
         rg1nv9LMHDvFAJDZ7YcFWKfzo8ZGrb5h8AuwTCz4FNV0ZQSgZJmCLE0hBINNy5ChhWo1
         rQp4O96ztZIO30Mr/zR0Cnd4n9OpU+1xDuPMg1nWH+r9feCNyXxN38F0RC5CrII3scAI
         EwXw==
X-Forwarded-Encrypted: i=1; AJvYcCXSn2VjctSGdNFbINt/bANmhLQwlVSftbWCgXvY9akdST04o19zpFH0hJUBz6wXK5pDbJvmikxS1FOk@vger.kernel.org
X-Gm-Message-State: AOJu0YxfXYt93we4aud+uUYBaY+swmb3IGWK0xMjICrFFDUQBxUWsLyH
	y2f4zf+x/Xvo7xph7GYsYY0p+sC4N3zm2meba0b0ju2wSxXZh19+RGbEHlE061Aw3Ps0mXWTfon
	Ks6iGF9fOKHJx5IGkXWIWS8My/qko1L92j+wNiPMRNYuM8WQCOGH6dI7cPQlElWIg
X-Gm-Gg: ATEYQzw9vdCIG6sZxVbgcDNmQklmCPdjh0hQlIfxeZuAaHEUBCi1MiNgTzki1Ojtjkn
	l+3oP06acO3BdntIF8pF3iqHnzrBDuMHs0iIjBWPB+mh/A53m0yslus7cA8LRC4JBTznHX8TVVH
	emEt6Zp8fIXaBMJQYp+hr7IkxRtZgpQKiv3oPUiv8iWspqp/NRy9j6MJ+5D6j5xkSl9GWh0MCE7
	CGcm/0SLGEArLvYSRCWcPmUkSdWZwCwnFo7AMrEJ6YOrVKcDl0ePLm0coZ4G/734KZowT/zE6Iv
	FL+aT/7JnU9TH317xVtC8IK04gfRb2Oc9xtrFbGVxOpMRfLSeHocMWHlxaai5mgmeTI51yl7hEQ
	hTaYwg0m7/grcEoxs4CK6GJdHi3u/ky/9Uy53nF9F9wtSou/Wr7N8ETV4dI5gUw==
X-Received: by 2002:a17:903:1a84:b0:2ae:5763:99cd with SMTP id d9443c01a7336-2b0cddb3806mr16899485ad.49.1774594295387;
        Thu, 26 Mar 2026 23:51:35 -0700 (PDT)
X-Received: by 2002:a17:903:1a84:b0:2ae:5763:99cd with SMTP id d9443c01a7336-2b0cddb3806mr16899255ad.49.1774594294904;
        Thu, 26 Mar 2026 23:51:34 -0700 (PDT)
Received: from hu-botlagun-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7a17c5sm59996965ad.26.2026.03.26.23.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 23:51:34 -0700 (PDT)
Date: Fri, 27 Mar 2026 12:21:28 +0530
From: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: lemans-evk: Enable mdss1 display Port
Message-ID: <acYo8CfMRReJcbW/@hu-botlagun-hyd.qualcomm.com>
References: <20260219-enable-edp2-3-lemans-evk-mezzanine-v1-1-969316806538@oss.qualcomm.com>
 <98730ff5-05b7-4275-be1d-1f9506adeac7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <98730ff5-05b7-4275-be1d-1f9506adeac7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA0OSBTYWx0ZWRfX+tedKiTgHTSP
 SvSZ3pjmv7Kdp/M5bPMDvhesbwYT5IzWUmJIh/ccK5St+WCMEqPnKtm6gTxIDSwavVu7CPrlKjj
 J0YrR0QR8efay8c1qFSbq0Azr/bqhW4U7aTI9LbmXO8d8MNz7wTuwnM6D0kKTKKTNiLLrekbJXw
 3MBZmMvsZbiCrmYi4U6b43ixmnQplM3S4yQJIW1IOXHHrh83U6fn6i8NNNu/2KYRLEWzdfA66TG
 iSdPEywEns34EcydeUQAA6pnw/Ks5e11qF/0JdNttfGJrmfsav8Y8FIyPJeaZw4djwtSU+htu2a
 9+vqRaVagbS66+rHSmNzqNv83uNPPX+jBcuvzXXmzojReYkXkb6joctDGmxHRuI5TKNIVkz5n+0
 hOt4UoCrBYv3l1BPwMVXxX1OWIWa83FwJtj/Oioh7/sPIifTEOjurwErF1yGLw9l82fHoQ4SyRG
 PTnjCNM3vdjqXesARJQ==
X-Authority-Analysis: v=2.4 cv=CcwFJbrl c=1 sm=1 tr=0 ts=69c628f8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=UdrTMyFB5_aLOS8OFh0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: xjwGgJuSvpkI6ihmvkz9HaPKqB-Xer6Z
X-Proofpoint-GUID: xjwGgJuSvpkI6ihmvkz9HaPKqB-Xer6Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270049

On Thu, Feb 19, 2026 at 02:41:27PM +0100, Konrad Dybcio wrote:
> On 2/19/26 2:36 PM, Gopi Botlagunta wrote:
> > This change enables DP controllers, DPTX0 and DPTX1 alongside
> > their corresponding PHYs of mdss1 which corresponds to edp2
> > and edp3.
> > 
> > Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +&mdss1_dp0 {
> > +	pinctrl-0 = <&dp2_hot_plug_det>;
> > +	pinctrl-names = "default";
> > +	status = "okay";
> > +};
> > +
> > +&mdss1_dp1 {
> > +	pinctrl-0 = <&dp3_hot_plug_det>;
> > +	pinctrl-names = "default";
> > +	status = "okay";
> 
> Nit: a \n before 'status' is customary and it's present in all other
> nodes in this file
> 
> [...]
>

I’ll fix the formatting in the next revision.

> > ---
> > base-commit: 1a0829927afbfe654c632eb2e779fa32df825b06
> > change-id: 20260219-enable-edp2-3-lemans-evk-mezzanine-1bef9932ee6d
> > prerequisite-message-id: 20260203193848.123307-2-umang.chheda@oss.qualcomm.com
> > prerequisite-patch-id: baf07fce333b86c35c3d4cefbba5800a519952a3
> > prerequisite-message-id: 20260217071420.2240380-1-mkuntuma@qti.qualcomm.com
> > prerequisite-patch-id: 74a76fd6a1129cdbbd32d91d2a119d693dba78a7
> > prerequisite-patch-id: f4a858f7e707c8e330daf2ea1f4da58b4da00f05
> 
> This is really long and scattered across multiple people, effectively
> making it a chaos for tracking. Could you please coordinate with Mani
> who submitted the changes for the SoC as well as the ride board to
> send these patches together?
> 
> Konrad

Sure, I’ve coordinated with Mani. This will be addressed in the next
revision of the dependent patch series: https://lore.kernel.org/all/20260226111322.250176-1-quic_mkuntuma@quicinc.com/

