Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB5341BA65
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 13:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786800361; cv=none; b=RFkiguBFWSFmqsXSqxR9kEUvldtUO0A8OeecBk/5F8Z1hMRHCdBDCzdD/fOYCX5C1BW+1HEKdnBDwb7iv8luJYZktF2Eq4wcyHVe6uHZ/mLZ6jUBNQ3KCIUqSOQAJyaZEVu2Yzt2JYF6b5E5EoA+JAWrthgAvxqFwbBxNO+7oGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786800361; c=relaxed/simple;
	bh=3GznvKQYOhzSKPXdcqHPxtsLzm97LoEPV6uvmbuw/Sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rY9g+LIAb/Idx+QBjV+FLcLJwXfIwGUE67ydHrb79gwPtIcscb7UUyGBvMCclH+NJMJOoVcI3xPP2vGO+mmYspU8aQBrg6HIErHx9PAQaYLLWLnEXpHNdPQfETGMfZh6L85/VJari6fGRwDf9zhXDaWdniMkw33of8Wr2FY6pCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oCYVLGvU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hFYdtmr/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oCYVLGvU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hFYdtmr/"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67FDNQ3D281589
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 13:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jUpVNSst2CU
	IlrfPT6QW+pK70blfmc9k+1OenQhK2Bc=; b=oCYVLGvUdy6xqJRGZVEulv3wAiQ
	khnG5hCIaocCDtMPe+xVfCu0S0RdOCOhU3aFs7+9g7dhsGrp+hx8NJaYEScfSooA
	/rndfiPYjLZHG19NdStQ+sHg+ZL+G70BCcjk9fYa5hWd7GSJnFSKN1td39a0GvUA
	5a1Via9FNsqE3s30gzx2yb67pV3xIsbV3ou9ptfkwJVOiH4OagonhnDpQyE82vde
	5Q0jcH7HONfb+bsoVkGz47aUihgkHupOIW0rqtVwQzsUqucUS1CHKUZAu7SUuVjg
	6b5cz+llabhwQniwjhqQ1a2UpmXsT9bqSSUCjix74WMMvL+Eo37+iMJzVUw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2gvcgxha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 13:25:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f0fe57470so3101442a91.0
        for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 06:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786800358; x=1787405158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jUpVNSst2CUIlrfPT6QW+pK70blfmc9k+1OenQhK2Bc=;
        b=hFYdtmr/0Qt7qt1IRSeVwrRZM9cuvRY9sMURCR3iuBistyMImDzbps1S1l8sdx4gDs
         kqDCS7NFDOgMQsSspcnsdEmiJwTwe6b/v4Ur07wTa4Ddezn8D0vGBz+9hIqFJ0iYL24H
         3umoioXMcncbrI604PpVABFBoU2VCbBOxu5EHv27guG0piIMCjhsgBjS9JwT9SKsHXa0
         IDhrSPdZ8CDMG2HlHjNsFc13J4uC4SYaLAUHLChQdwAUYtqlhECe4SHrsW9xSEcfm+gd
         6vx4mATyCgpMzcwFVMEwAqKbwhgJbn+lqX2+AgCt29UDVzur3HE3Meb3gQyaQLENS+eY
         SIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786800358; x=1787405158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jUpVNSst2CUIlrfPT6QW+pK70blfmc9k+1OenQhK2Bc=;
        b=d/leHzNsbajsgEDyWgjd6mpzmtTzW37Tl6eX2Q2ec21WGNqNN7CUj/jztYVG9uwDzY
         z2UV2aLKZtbExr10OOJa0+VmWkLni4HQaJplkdyQ24xXKdRai0WlFopp3p3AKebGFO4i
         oon8jH54Mjl/Ce26NYbWZ+erWzhB8FOTC124ZAvvVLyxMCHjxXTHlJHA7wlDZ1iBSSob
         SjEsCV2AsDIS9zhj4TyLDKiyzHvYa3GL6Kk0ztcwouO2Ae9YxpadMnyk5XGgFkrOW2SE
         26EYtOzg6isIymcPq2t84FYWJfoYnhbQAp21FTKGO/Zzdm+EpheMr83HIa4cqpocX10g
         zWGw==
X-Forwarded-Encrypted: i=1; AHgh+RrjJx1VYxJffNocQm2s7FcUxY284zZvOVyklojzOuVZRjXkT4CHO5NMWxhaBLMZdVXIzH5H/+9fqqLK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3sNZP07wgsE7VRyfbkFkplqeYL4FG9i1N+Il6rzgqPGAyijru
	mCpTPnufFit3DBhyV7uAaMM9xOureyxTJHpHM3kGGfJbv7SDwpr3wddHMSk9el0E72DJ+xF1sQU
	ncFu8YpJ+xCyk4i+yoJhm4sTkrwWemCmI11+3fO4+uI1QcTKF76eNhQKYcCVJEWPS
X-Gm-Gg: AR+sD11jqp94ggTRljWwj9DNQSfAmQ2PIqh/aVTCYroUD/XZgqLp/fQlOLXJDico2Dm
	3C2/TQP8U/bEkkw7rQUXIEJitz7fTd/SV1e2J8RBN/XdxhaAkB0HmE5ZTNR5jnKOUrsE5iUNbvJ
	nBTdgUUV38XKXsFB5H90hxKqbB+k1pyl+d9v3OXg2trRoT0mnME0Nn+TC3+CDA93izETg2s7uHH
	D1w1fR7Rm4u9bCZUHFd1hQpKDisdrUySClPkI/eXKTcxHu6P/ZK04s4l4ov/Xl6gOxFnrQUugtD
	YdS3Y28YD1VjFc2Fxuz/rJm3HXocQL7rMgpcMwx67je2KwBoOm3bWGA4vjZejEil/RC82lcRnX3
	7vHCVUXqLxQZXVPUjB398fOGltOm8snbmsgg7jfIk3XgpUTfJoVV4xWif5mOp
X-Received: by 2002:a17:90b:288f:b0:380:86d8:8162 with SMTP id 98e67ed59e1d1-3931f5f5fffmr17005632a91.18.1786800358294;
        Sat, 15 Aug 2026 06:25:58 -0700 (PDT)
X-Received: by 2002:a17:90b:288f:b0:380:86d8:8162 with SMTP id 98e67ed59e1d1-3931f5f5fffmr17005593a91.18.1786800357774;
        Sat, 15 Aug 2026 06:25:57 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141386a039asm19313374c88.0.2026.08.15.06.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 06:25:57 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/8] remoteproc: Add cluster field to struct rproc
Date: Sat, 15 Aug 2026 21:25:35 +0800
Message-ID: <20260815132541.1575121-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
References: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfX65FHHa7/SgLz
 2S2F8tuDhVKzSSgySHsetAeBAuszlCz1S/GG1zL3MLAHaT7ck5Dk54uEWeS45OxKhalPEfT+unD
 DWOaoMrvqzaR9ZmHuFkc8e6AvG2rymk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfX54xjI0tPVZ3r
 D9yybFq1gIGto8Q3Z6RJ2OpgrykOVqbAyEIaogo365EHETSSvcixTaEU7226TcC9YeJCWthr+xj
 FhzPI4hZouJc9rRZMDnrUZhLh875vG85KQO47yt0uyO2qqzOrG1JQTfg+9oehTLdVVs4OSwjx8C
 JCIX2691+vutMPwj8t+uPeFt7zvsYlX14PD59WYxNgDYqLNKtkTEdRo+mzn8hrbGhsgywM58Bex
 RQAsDvFv/1U0UhOXmCb3U0rn/TL0c4B0RaOVilUJLgdzg/ZFg+ZJKd5sy+4o2mJFLjQGbP5eO+V
 qlZ/0TjBnxrIIh2sEwk4pNf/cjC4tV4zId95kQFsfzx2Rtob7qLMTdaaikibyOAlPBch18le2j6
 VlbqbSO2dErnC40mQV+IUQ41udWYZ2w4llN7sKo9p95TW3qSXUKT4hf2smfXCDbdatYWdHmM5v4
 lBjBwJyRL6Q7yHuTvJg==
X-Authority-Analysis: v=2.4 cv=UfhhjqSN c=1 sm=1 tr=0 ts=6a8068e7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=wfuvY1oYJVSYwsIiQWQA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: z7qPLZq3smxflZs_cKcHkLRSNvtp3mrh
X-Proofpoint-GUID: z7qPLZq3smxflZs_cKcHkLRSNvtp3mrh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608150096

Some Qualcomm SoCs group multiple remote processors into a cluster
(e.g. Nord's ADSP0/1/2, which share HPASS-domain PLLs, AG_NOC, RSCp
and other resources owned by ADSP0). Firmware on these clusters cannot
tolerate the peer-shutdown notifications that qcom_sysmon and
qcom_glink_ssr send between independently started/stopped remote
processors.

Add an opaque cluster identifier to struct rproc so that those
notification paths, which live in different subsystems (remoteproc
and rpmsg), can recognize siblings in the same cluster and suppress
notifications between them, without introducing a module dependency
between the two subsystems.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 include/linux/remoteproc.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index a44368737b39..53e56d53641e 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -254,6 +254,8 @@ enum rproc_features {
  * @cdev: character device of the rproc
  * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
  * @features: indicate remoteproc features
+ * @cluster: opaque identifier shared by remoteprocs whose SSR notifications
+ *	     should be coalesced (set by the owning rproc driver), or NULL
  */
 struct rproc {
 	struct list_head node;
@@ -299,6 +301,7 @@ struct rproc {
 	struct cdev cdev;
 	bool cdev_put_on_release;
 	DECLARE_BITMAP(features, RPROC_MAX_FEATURES);
+	void *cluster;
 };
 
 /**
-- 
2.43.0

