Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303857;
	b=EIJ2lZzWJc5zbvUQKJPXGLG3fMYSlGqPjff9tfZryILV7k38LS43YXOuBTVaqT7/S3FY
	 STin0Ck6ezofqzeRByRbToaz6a/RE5ESpcqe8tSJVvApB3eWCcqQ1d1jT4n0Xq5GXun6J
	 JBzvksN8VVRyPIUKptuqCS4vuhy3ZpQHYNStk6O+4nMyRSwAgrG/A9bTJUmGEM8DzDcvL
	 Y6WKWSeze2rbTXTPnw8PLLfeUzZi2I1AShyuOyWHyEJDqRbenFEUW7vWJBeh/17IXSnij
	 BqVBTgn5pr+20he6FqV36EkQRypJn/spmLxL2fP9p17eqZLFO4VQ0AsV1luzKeO5x3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303857;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vdE+aUoRB/9Y/tI/sh5Vrl8DHxfhl/imM7gAR4Jqcas=;
	b=j+D+G+342WNgaQQaQWqC2tZAfUwIRrkyIS/ja8I1iWtGQ8SQ7LcUSKoPNw5hatA1VO0T
	 VrLh3clw+sgX45BvblFrPds3DNdWZ9hmgxcj97djsLS0s4jIj2UezhuA0528u1pGaXHb8
	 aReg9XLF+zenLQribMFvK87/9Qurc4Dm86U7tAbMHrzQa7iLgCVLDz5VaZRtGQfBAAlaJ
	 ehsA709lVbP7bk8RlFfRJ27w0x+7wCc1kvkJCy9sXBZUz3S3ZTbOPxNTWYsbaU0jIQQNg
	 Gux4tssXs8KeIandN2n3jbx5DQp1T32OZTBM5xherFHlWFNbYLNnpF2ToxJTXTfPtTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pjd+j2qw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ExnC+ub0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87F6607697B
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 09:44:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C87F6607697B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pjd+j2qw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ExnC+ub0
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7l4N21155033
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 09:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vdE+aUoRB/9Y/tI/sh5Vrl8D
	Hxfhl/imM7gAR4Jqcas=; b=pjd+j2qwJdJcrbj9o5ABpubS50+2iHpAbx3QsZq8
	1d2q2RlRBJEalsu7/HxcengRpag67otltjJSK22LY8SMKYNSUjyauL2DwFqfQ/VR
	JHUD1XggUxctF9Ue66MR5KmKJZYek+E0FT8E2mzeo6hymyiVb2vgWrkxfVN9dwOD
	kfSoj68eSxlq4q03h8UC435RyP5nL9F3Z5mZ2f+KBIszvhuqd+rF+Ngn7ifcZwie
	b5HiGZIsiHW/K055LFDaYdYJx3D7MgG2T39wyMvnhas2Y/hIZi3HXEdbwG8t26Xh
	VNqKEGK2deI+3jDHFAFXGVGYdja/mEvAbbSmH++F2jnwPQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hutv49h5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 09:44:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb93c874bso378914285a.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 01:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794303855; x=1794908655; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vdE+aUoRB/9Y/tI/sh5Vrl8DHxfhl/imM7gAR4Jqcas=;
        b=ExnC+ub0gDBNjFNvvuucx/wqJORHedq/2U0LIedg0lOUny7obvlfT1SMJLLE+a/XmA
         TIqO6YvVTWpKuxM26rqihYpQV3cB//9wz1izwIESSowsIFFXC+6Pfq4ug1YzDy6WIY6F
         f8qkLHp+0qsAUkPfEH6z+NZW+nn1G/+nw/qKXLeanEosZtw3nXnjdHiP+WxdJcjdjMdm
         3AOMBVhAXsm6FpYzpBJ8Cm4p8rfNtFe+o/bsCpkhR9EHGYt0temCodg5swwlZLguAEkL
         Z+e/vP6T6nxFeESAbIth0fAZRz8aGjsXG5OMvDH9gu02YG54T2ceDGtjY4SLNyk1qGF7
         YtcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794303855; x=1794908655;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vdE+aUoRB/9Y/tI/sh5Vrl8DHxfhl/imM7gAR4Jqcas=;
        b=Ot9nq1ElRjHMKF61GfTMGIBamQmF/sOBKo4s9r8nnNBQj9/AQHRWF6yos/v1i7PmfY
         ucEstGt/ZG5ef1Va75fZ7T+U749x3vfN+8qmbj1EF0uplqnv3s43L0B/QkGuSZNAYWgN
         OmtUIAUmKO90Azg9WspL9M0Sgd7YLyXIKmIMhK5ISzZgFqjdXvTWS2SNfNTqiurHd28R
         MHVGbf+qtq3FDaAgKtb/vjcw/hQZu6iK0fJ+PAjq8hYgT0sEtQaoNHcoCC9XE/grkJkj
         4SW7O/FmcBCNfg8taO2LXEWtx9H5U5bDATNkrCKNpSNh5jLVVpc4saKVhfND8MHkQvEG
         ATtQ==
X-Forwarded-Encrypted: i=1; AL+hErHez8ipPmOOVJT6PfxQCYt/eRmy8US8QS4HOm8oABTsJHxKOkN9egCLLWl9gj4iqKL40tusVRtQi1bg@vger.kernel.org
X-Gm-Message-State: APuU4Z9UhXzgUIHH2RSALeYcoO8sntgzcummcaWAAUaadeTAtdJf8B16
	p6LM0S5l28bUTav0EwBA/DoWrO/Zk2254KK1wLDZz+BNaYkASQeD6lZmlmPHY/WSacLX+JDjLYB
	0JIcMGehiFRJKMe4wbvSVjJ2Zxg4DsWL11mCGfaHZFHhowIEXogWjIFnfPn3XqKwF
X-Gm-Gg: AYBFou0NVjDxKKEsoHsh3dsf3xpDqucfgSc+fTmlQ0bQ+vWdnlnUzXMewaNLQGvgiTe
	6LWuz6J0qRH8W4QGRClMIRjDr5iI6xA1A/djwgf+fNPC6K0vAau7Ung6K+XOkP1J86Vv+rt+U5d
	rKv0o5QKKHByaQ7CDYLhF9Tjd/uELLSI+9idwJfMQ0wV2/8dEgMqpLkconwKpSMeISUXZbIcwYe
	Cym3/euai/Du8zfrFHzwfsy0kXYpQ/xLG3YdZ1XLfvbIBhcjP3M2aa8FsSBsg8LLCmyk/ri80fi
	iax8Bwx0uUp7Rw3hTeig1miO3ZcMq+HVTXxsYmhSXR0BKGwHs05L3zzSubNQ0zvy5LXBU4EfIg3
	K59zVE7sOgN+1EwRFNNUNQyJ4FBijiBapdPSGog9Txk7Z9EGOvq2MfTEZkwev4bXE
X-Received: by 2002:a05:620a:31a9:b0:944:6ad:1b7f with SMTP id af79cd13be357-9479f22a764mr306205885a.32.1794303854753;
        Tue, 10 Nov 2026 01:44:14 -0800 (PST)
X-Received: by 2002:a05:620a:31a9:b0:944:6ad:1b7f with SMTP id af79cd13be357-9479f22a764mr306202385a.32.1794303854177;
        Tue, 10 Nov 2026 01:44:14 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0204342asm60996725e9.6.2026.11.10.01.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:44:13 -0800 (PST)
Date: Tue, 10 Nov 2026 11:44:11 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 5/5] arm64: dts: qcom: glymur: use Aggregator TNOC
 compatible
Message-ID: <3drlpt2ox56togk6tf3bkejsmznfujgutkpzd7t7zimhvgiu7v@g7gddlszxciy>
References: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
 <20261110-fix-trace-noc-probe-issue-v7-5-2f06905c77fe@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110-fix-trace-noc-probe-issue-v7-5-2f06905c77fe@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzOCBTYWx0ZWRfXzdEwdBuDerW9
 WTHIsC8zNq7etmDMV/0gjd74LY0keDpZ7BH6oiaaehVUg0Y85ydMB+HkJDGWfVj8ibGDqVpgqod
 ul8kajG+YMtFPVkoOVq9tRefO9G6Vww=
X-Proofpoint-ORIG-GUID: jWBZpnYfyxuC-3FNFnspxNi2Glo76RA-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOCBTYWx0ZWRfX8XZ+a+QOLuLz
 PNEo4KQEtBDP3FdIRkmox99om2HcApRYWm8JbyjqsX8WJTqKQ47/X2hULKNtHWW+MxsBuXp/8bQ
 fvkNUzIs2fpcqZO7fMUZZNfoUwUCQcU0eUS3pEdu0Y4JpFFSEtOP3zP78XoZdsn9xgPUMJBigUp
 IZu2tGzFG+0ELuQkIkmgcD7A1bA5Cq0mmb22HNkGge9yNipKg3HUgkf1scnTz1BHps0dRN74du3
 4uYKd2qpDYTyZelaQRwDpyI/qYZ0CRZzyKqOV5NJSiOZSMX9zXdp18X39+8dwaN2JIEfDHnhFx6
 UpJeplzqwMkLqVCI6Ec/4QmiKO0kEKxr/TNOd3Aj0q1CT3PqwkLEOPNI1WLf8C5K15GSBoeTJC0
 JFFvWzyB3omr3qfBPD/vS6S4ludPHRySHaD4oU0v60Wu1f1N/LHS2VobLRa2mM39Ebx9U/CDPBq
 y0S5tzOwhJ8NjZIDBBQ==
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6af2e76f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=p7_fsQVHwOYSS4OMyj8A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: jWBZpnYfyxuC-3FNFnspxNi2Glo76RA-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100038

On 26-11-10 09:21:18, Jie Gan wrote:
> The traceNoC node is the system-level Aggregator TNOC, so it must own a
> valid ATID that tags the whole aggregation path. It was marked compatible
> with "qcom,coresight-itnoc", an Interconnect TNOC, which is never assigned
> an ATID. As a result the aggregator had no trace ID and could not tag the
> merged trace.
> 
> An Interconnect TNOC is a subsystem-level aggregator: it merges trace from
> the ATB sources within its subsystem (TPDMs and other ATB masters) and
> forwards the combined stream to the system-level Aggregator TNOC. It
> carries no ATID of its own, because the Aggregator TNOC downstream in the
> path already owns the ATID.
> 
> Switch the node to "qcom,coresight-tnoc" so it is described as the
> Aggregator TNOC it is and is assigned a system trace ID. Rename the node
> to "tn" and use the "apb_pclk" clock name as required by the Aggregator
> TNOC binding.
> 
> Fixes: 1f7d0c42a08d ("arm64: dts: qcom: glymur: add coresight nodes")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
