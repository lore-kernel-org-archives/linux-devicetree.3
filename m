Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B393DDAEB
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783933490; cv=none; b=W5OIT3HR5IAt44T+CP4IB+tNxpELrC1PPD702PRL4NmUUTqn1c2V0e8HetEAKTnEyX1n6d7rkha0BjlZOuCObQyyS/mIj3hg+boJ7dFoKW2B2rNwTjLHicIUOzaQ+FBrlYDsi5dNmVrXYYtXcS0F+JJJg2VdO+9QXwB9ANCLm9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783933490; c=relaxed/simple;
	bh=fvzDiZ67AMugJfYnW8hKFy6ptEIPS5tGSZjlOp7y0GU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kDrKsXCf/KNihv3EZmyoGMURvhM8iKOyCft44GfspNZLxCPy3XAzu04zhcpqOVFNYVITXUaBriJjTJ26gRVBvdRsIyqk+5vvrIJcm7RycSrua8HaMbXBJitSqIdGUhISN4u/NuePxmO7FsUEyS+K6LZQ1/rDzQyHKw9t5FGg7Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TtL5+IoD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L0aVbJ8Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TtL5+IoD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L0aVbJ8Z"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D77MHe810491
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qmzQ69Ie4mcQOk1JreV97QpBgdyvfWbFuRHTnab1d4E=; b=TtL5+IoDiaQq3q1J
	dOJvBcjoXyZJyTPVt/1FHGGRUxwkG/L/y2Zd1OeP7jaMPI8ESCu1dpVZe6q/aNrD
	+mkPA88cDx8dWOU2hW8Wq5jt17WpaqsfMmN5SJgjTqCF/hWDmeKai0iJvvZrIhWj
	O3JeGcYNLiihHjLHMLtbzUqg3SLCbpb0Eoi3uU1nRy9kUWsDxQLAs03zguliiOE4
	K5SGkuVBjmiU8MsY57IJv2qi7XtqAhJdSFRttvytgk7us5+vZDHypkIcHAau3La9
	GoxitdVjWzKo6o7HjRxXe6FGet3aKoyTqy1VsdAY0+q4Fvx1UjTyz0AGd3FOAc3i
	vH3X8g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcubsre1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:04:48 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so2059905a12.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 02:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783933487; x=1784538287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qmzQ69Ie4mcQOk1JreV97QpBgdyvfWbFuRHTnab1d4E=;
        b=L0aVbJ8Z20JIpgSH2PukZZNAoRSz/vuDvy+DVGZPJcSE0ndleNQsgLconif4zKFq3/
         o2j+/uCc3VZCsOyjrGnxgxzPK+qUN/c5DqICTCFXYmr+szejH+IR2NL+u8lgf/iOHtJ/
         xrBmfWpOTAWQOShfa5zDzmqj15WnoWdsqZdXqCRXnL4hZVbEZ0NulX+DrSTCCUXce5h0
         JK61y/anA3hn7bEnP8LgoPkYXx7Pa3nnLcvJCbu+9c/rEIWz7QSnReyJiPPjmYzqrhWZ
         WphFQqqUdYkBede6pVgcD1L8lvCGj4VvfayPk4n1jVa9sn2cdKQvU1haPin7RPzfuzVj
         ruew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783933487; x=1784538287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qmzQ69Ie4mcQOk1JreV97QpBgdyvfWbFuRHTnab1d4E=;
        b=G6P0jPyRJJbjnMDVqBASN8vNpFb267L9UVN2F0L2KDXQRAgewLpmRgbJuw6WdFxbdb
         lJ3zPTGCoR7jYDMI0YjT2hQFUgIrbnZJR948LcO3HKzbYiyDsEtTvc0i+j83Cy2Dbifi
         XGFL8trenwcSRPBxXrShJ8Wr/CO6B3Mc7elc+D6nyXkR5gA3qqGe31n63cTTUn01RGx4
         /wO56UtgVv1Z8p1tAL+HrFUBP7MO7m5NvTsZlv6Y5b+x+ycouuUw6Ww+ImjPKk4Od+CE
         0I9mf15rN4jW3bS0hRfjzU5zn57+R1hVIQx0WeiXsrdQFUZOu8HHJtwjBny2bOmYKZw/
         AqOg==
X-Forwarded-Encrypted: i=1; AHgh+Rqh+4jflh5YHKhIf5W+z/FG7fDu5vfdmMZyuk4j6LGQqM4cEqlR2FXr2I/fveJRFndC641qZ2zzynIT@vger.kernel.org
X-Gm-Message-State: AOJu0YyPu7YReyR7OcWGzq+cd/0eqotyR2QTZssTQy2QtAV+sVjOvhyp
	d+t5P8bFrXp1EBtwfYDD02gMSxlFRNmGUqXWdt7A5J1YVG8hxG3Mi+nHySUPFWjML3b4eJLb8Dm
	cjd6bEkWvaX5I8Zbe7/7mesNv4kxz7gjsS9kCKJBQIQPs/SBpbAzaOHlVL2QPI5NC
X-Gm-Gg: AfdE7cmar6cll5oIwMWKTv/HIIKAePskZM242WsaiQY3ch82K1hIk9tlzBotVy44I8A
	8fvTycV/UUiXnirPEhJw//5k9XqDnGwd3/zPY/R/+EbX28q5nLXLub+W0cE+eiXOvaXYGqLn7Br
	BI3+L0hHxkNLVBpAqb2+3Cb5MfKGgi2P87G1H8J7T6nB2v7CUcfuaZt6w+mwg+JYcdVh4cbJjem
	zIu8Ra/DvbKg1Stajt9PNUFnGuSi7S7l/HuXOejcIJzh06KpFPi6S7kLdDXzfW9VFXPp3CaFJxn
	i6QcKxK9PbWmf3B/LKLBNr/kIT2Z3zS6g7xIdmI9U5enLuWzhohI9xdrpWzxWsRi0V031effNO7
	NtofDw34GgaBP8NNQ1FL4RQZK+iptaEY6orE=
X-Received: by 2002:a17:90b:2247:b0:380:ced0:ecf9 with SMTP id 98e67ed59e1d1-38dc7822590mr8390941a91.4.1783933487295;
        Mon, 13 Jul 2026 02:04:47 -0700 (PDT)
X-Received: by 2002:a17:90b:2247:b0:380:ced0:ecf9 with SMTP id 98e67ed59e1d1-38dc7822590mr8390911a91.4.1783933486867;
        Mon, 13 Jul 2026 02:04:46 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3119c2a7bb5sm43504435eec.25.2026.07.13.02.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:04:46 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:34:11 +0530
Subject: [PATCH v2 5/5] dt-bindings: mailbox: qcom: Document Maili CPUCP
 mailbox controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-maili_initial_clock-v2-5-79548f0bb58f@oss.qualcomm.com>
References: <20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com>
In-Reply-To: <20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=Oq9/DS/t c=1 sm=1 tr=0 ts=6a54aa30 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=5FXc3QUEpXE_4WiDhFYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: E5KOY5FEBSqc2QDu7zvFfq9UUsrBjnbF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5NCBTYWx0ZWRfXzwLkMGjSgTxH
 4DFpzOzld9iTbIOQfiG18vapG8uHfHxC6+vOZHwkQBqdt8kKVfJt6QVqHjv42beDDcYZhj8eLqc
 ViOlh9aV7a3TF9ivfq54tVq2+b//blg=
X-Proofpoint-GUID: E5KOY5FEBSqc2QDu7zvFfq9UUsrBjnbF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5NCBTYWx0ZWRfX7xoxf69xe0rx
 feqIlWE0imQd5FPD1M2rPKKyT07med9shTCkG+aY7ShdWkBU+j4uZktlgC5Vg6GOEytvxMnTvMA
 cm98HOK3wAbsQ1y/Im2vtgAhlWhPbVK3vrQIL8czLPDmLrPMBm+HHLkXrGlRKJG3LpJPIGv4xCS
 WsvnLL43qA49Rx7XTN9iP+TScJWXo9uvybFCZpYWiQznCGZ3//aZ7Y0GW4P0v9TCAvqMEf25asQ
 fr9qvo+QCpFP5xiG59XlI/gxH883DI8L4wM/8ThF4xC1/FsLt7DOd/ShLaeYx4zgl6dNDSCsC/v
 XNeEnjfbh7bNioXh8ujwfrfkxZ+B+TFh+9fwgnuDxhucl8QNH1MLAHbyT7YFd89+GiJYF/unzSD
 V98cDslmIKZ2lWYTHAWphuHlT1Nncmx0mGWbbMiPFl4rl9yyYVbQiYmnb0ywI96gwe7UQm2USCo
 Sx3T85Op1IGZBnsrKcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130094

Document the CPU Control Processor (CPUCP) mailbox controller for the
Qualcomm Maili SoC. It is software compatible with the X1E80100 CPUCP
mailbox controller and uses it as a fallback compatible string.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
index 03359479d926a623c467f1b8ba857d787366d411..2185920e1b5d2154a23b67905106f35e0b71eee9 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
@@ -21,6 +21,7 @@ properties:
               - qcom,glymur-cpucp-mbox
               - qcom,hawi-cpucp-mbox
               - qcom,kaanapali-cpucp-mbox
+              - qcom,maili-cpucp-mbox
               - qcom,nord-cpucp-mbox
               - qcom,sm8750-cpucp-mbox
           - const: qcom,x1e80100-cpucp-mbox

-- 
2.34.1

