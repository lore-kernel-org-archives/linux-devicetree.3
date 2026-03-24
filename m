Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E23038B13F
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 16:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774369913; cv=none; b=lOlrT3v5cuJwii7xwR3AOwkb6Tz3IQyW7Cr391/kzF8tX591l+qOVYfFivx3xiSQGabw5/1GbJNnuXQvq5C4ujY0UOK6HF1qoaMhHv3FtPd5SRuljQ36CVaB3rJsYyc8X55WzVCXdBNPRb8PNCGBPBKCix43UOf9it2j0j9S5zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774369913; c=relaxed/simple;
	bh=/7s67FtLVQ7osFtoNaW8ycH8+kFQQs5/C4IOWP8ZXZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQl3PMAliTgC5gDfn5COiKdUUIl26FgyGppyJtMuBQ7gLf1iB/gOlVxLLM2f1iL6NYap4YL01GvgSGkvan1aLszaXwIONLgUJGss1ny2eoT/oyzeTVM5nIJ1MTjZrOdrPcKoQCYsx6QTgXS8wvFGoJeY/FlqskeWlR7DM85zJgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hjBk/3V+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BQLZYVa8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hjBk/3V+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BQLZYVa8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OFTeXL890443
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 16:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c7CY9526LGiuXbFCoaaH0xLf
	puUVm/HTTCcdhq9z/cI=; b=hjBk/3V+9Q5LVkSu9Bh2FINyFGF+qzvO0eYqGfXQ
	aSRzDnV8MlIswbwF6yuO3m98OVa6I4vkfUhIBHbxNLSLqaaw/fI/N0zOyXafHSLr
	t9Znat/YV3R5EoGwcUtjaoyx63dTMegBSeWGfOvxoYF5dXatjOSKbnR+3zpOk+qE
	PUIseR4p5TB9RghUkOnOqOCOZKrA2yu8lYXvkXvViRs9NJUlLPc1YGt+Qgk8pYvF
	PYHqIq5sATfkxBTjdtkk3cMct5uTW0GHWWnu6duLpuZFbqhN9mlfi4ais4klcOOq
	d8UnXi66KN+KZN/C28mKi9+IOLCJC7W4dxbT+6UmhYFCwQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3k1xatdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 16:31:51 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-948476b92e8so4476970241.3
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 09:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774369911; x=1774974711; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c7CY9526LGiuXbFCoaaH0xLfpuUVm/HTTCcdhq9z/cI=;
        b=BQLZYVa8i5a68DXdoSMqKycZKjEW7QD5GJP2zFUKTvFv+x/Kn6nwIaDypeXDvWckLG
         mR4FYaMLWwT9iEuPUO805Z9NV8fsNPGz7Vuk0iFcb6hp6yrArV9FSCPTKEdhmOgItKah
         cZuNF4ymcU4DqmJPdWG6rS+2c0cSyk0atlMi7tguxRgYGxZFfwpXU2h82wmJxWTY8HV8
         a0j91PUXx/kUzXGhyTwT8FFRZP1kLa+q2cqWnA7rSkYaD3OQmQPyv3TkjcZvy2iGR8Ve
         Q3+OWomxyHdhR1XUa0uCml8vIUr5cotoKnE7Rra+s7bOL0oDOR8/1jzpdBRV4xpBmYZ0
         /xbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774369911; x=1774974711;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7CY9526LGiuXbFCoaaH0xLfpuUVm/HTTCcdhq9z/cI=;
        b=CL8jhHTgqEO0OolxcJnqWIhHtN5vYp5AqCi5uB1bLNsx7gPrN5fV6tt2TZ9JNT9zEA
         e7DO1XX02FJ5uv44U3P13GM/vX2Ap6+URlbr7l7ElJXntDeWr9Sl9WFkv8RBLjTWF2Y3
         xHZ9JsB4ygFIL5bVeqw5LhXmS7qoJDwDlV2LMOP3PaWAOvbCH00sTW3ZsamtFKTflqqa
         XnZYc7EuSlW2E0JmTvsFe/AJDjXcgnL6OqINsb06nDZ4spt1jaa6ddjV5UpvOGFwj6N1
         1MUPuOwn3s3yB4P44TDl3PLIPRxxTM78gpp55FKXDuyna792QRhzAInI5dh+x0cPCUHv
         YTag==
X-Forwarded-Encrypted: i=1; AJvYcCXMRWHkqqgX1ultPAxgcDp9F2pmrsw9MNydSnLKA49G/xYB07x/7y24emwAFzXU0n8yg7iaatMhk5fD@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg65l2ucZNA0WGWx13irp1k/1zp9xtX8rUwCAhZO4owNfLkkX7
	mJcwdHOfh5xZnRGrCbRsqgYGJ2ivofnWhH/RWqn1T1fULiFt3hPf9Eok/qCLVSlmbtKUilvpcK8
	AT1M1wte+tQIn3bhm5suzGrTX21cV6qudZnKbGskOduS461qs7zVORasFMoOyW66o
X-Gm-Gg: ATEYQzy4l+K76OCCtOKgBGvVabLSwY9EREcihp/g57YuO4DpV4SXcbvbM7scHoAjFWt
	XlsSgEDHHcRM5oZ+Cqvt1EO7vRH86kJ8XK4XEonk6MbT7yajHJ+I4LuQSYWzAxFTUQlj3QKLilK
	ASrX96ZbmQnfBTKzGVWrFAKQTVWqvU2elXB2Ek9a3iS7whjoKic96vsVcOrzcgdkmM2EFjAGfR0
	l/5L20nqJtxB3XMtoP9p07wXNqbmjUCFF14WXskwMz1LBV8Y4GHNkLVXlME5S2BuJ0/YG2Uj8Or
	bvrW9bI2Vh1LumCfuiWI9QHPidlxJhqr6UGxn7FaVeGt3Cx8X50l3kKiYYuLz6PHLUei8bx+d91
	NrtqpOXNTOYXW6USWX3Z+ioh1bXXzMKkANg==
X-Received: by 2002:a05:6122:f8b:b0:55b:16ba:2854 with SMTP id 71dfb90a1353d-56d21f7435cmr297942e0c.5.1774369910587;
        Tue, 24 Mar 2026 09:31:50 -0700 (PDT)
X-Received: by 2002:a05:6122:f8b:b0:55b:16ba:2854 with SMTP id 71dfb90a1353d-56d21f7435cmr297877e0c.5.1774369909995;
        Tue, 24 Mar 2026 09:31:49 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711693a08sm70578515e9.2.2026.03.24.09.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 09:31:48 -0700 (PDT)
Date: Tue, 24 Mar 2026 18:31:46 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: x1-crd: Add Embedded controller
 node
Message-ID: <ec4jkg4aaz2mufzluglx4z5zh3qh7g3oteiho27kux7amn4y2d@qzij5lc4tf7i>
References: <20260317-add-driver-for-ec-v5-0-38d11f524856@oss.qualcomm.com>
 <20260317-add-driver-for-ec-v5-4-38d11f524856@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-add-driver-for-ec-v5-4-38d11f524856@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEyOCBTYWx0ZWRfX1Q1ZFrxHRNor
 ViZnyHrhfiT8/ffgIK5hpbq6SRozitTbc85/B3NNz2jrQiiymHphY0y28IqoJ4y/AI6Z7g0GfTY
 sFwVyBTsm39Z+7aWauXAw9kMFyKWAHs+WBitavgACF6imP4IgeGFgJexzr4wc52mwCUtZfwyJzQ
 kAkoUUQm0tm+pI+8d0ZkmID4U/dKiN6TFHgh/smCrjWe35cqtkuDUMpglMnFgiwZSBkkFll96uz
 NLIgY6s5N3cv2LCTzPGJn9FfBC1QUS6lo76Lmx5v/ugbm53/GFbosx7M/yHmTgpQ3ekbCWxcBEE
 IKyw22Z1rvtdoWrR7lVi5rAuUxRw7BkPZLdjMw3VWntEAy4EfHBqgFvWPfYomb59BJuNdI+h4rB
 7zNhFJWsING+klItsSsREhi1DKtXYFYnju1nYgBhKIDNzMvgxiA+u4oN1B7mUJjrQE/WByH2B3Z
 Im909N8w+Z8XS5l4lyw==
X-Proofpoint-ORIG-GUID: 3zbiQOKiX0Ato8y4fVmNKQxlSUiDR_Ij
X-Authority-Analysis: v=2.4 cv=O880fR9W c=1 sm=1 tr=0 ts=69c2bc77 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=6SiODLxq02sLjzxsB7oA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: 3zbiQOKiX0Ato8y4fVmNKQxlSUiDR_Ij
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240128

On 26-03-17 17:57:58, Anvesh Jain P wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Add embedded controller node for Hamoa/Purwa CRDs which adds fan control,
> temperature sensors, access to EC internal state changes and suspend
> entry/exit notifications to the EC.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
