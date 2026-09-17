Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23E73C9EF1
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658096; cv=none; b=ikqp0LCDS+IuJuE3jFEh3R47PRMa7KscokSqNCXGCE6jxWmnR0FmlGospZNOdIUsZJyqdSeB1gb73EYUYPN1OBV6+FyS05k+ou3q55MsVOuKB5QHk0wRHPkElTWq2utDz0t4KEwWflNyX1hviE+cC7iVfn4PtKuCEgFHUpbEkZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658096; c=relaxed/simple;
	bh=o6usTF1cUqrcLTldjDsw7thVeXzJFAV5ZRdoFq7CFPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o3qaX4dTLfbsSa/HRSbE6k+/Ol91e/Rzfm3B0kPVwU9YghqwyWVlDAclQb4HQh9UYiHQawpO3QfeLxbjbg0ln9bzDGmA4ausOIpe6juhzcllF9a+jKlZ3v5X5xIqU9VVRRLJSAYrQv6R9uIPZDpPTuAGPQmfroq/VwgzbbJ0KH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J/kZKm9I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WyzNYYMF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J/kZKm9I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WyzNYYMF"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HFA6AZ2024900
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:14:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GjrcoUvvTRR8V2GjuvP2w4bl
	COCAR9ShGqbE3Pn80+U=; b=J/kZKm9Iht2olj0pqweHJ6QAqKiPdMJIm1mTX+wJ
	P4WARLi8PvC1BYZhPxmXX4OPy6b6klnV4K66vSkqF/SoBw53lJNWM/6+9aHAMxRO
	12FAscfIU6Trn8h260bcfDc2hV8SRVPcL0ki6OHO2xqOZnKUPzePlit8GuATfQkQ
	zYIds2b3ytsArH8/SoaMsv3UzKxjEbzZdY7uxuE1w5bopeURpwBKjr6En0V/YiCJ
	ep3W3O19hnR3+R5gQKL7yKv3D06kkdcs7wDX/0tTLeG7RBkIpsxfnAw4rJpfPXAw
	jZiBU/YGc+VQBknykP7HEPZSYp2Go0U12MlVka4T8AyUqA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grjkt00r8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 15:14:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-530d43c9a55so18467741cf.2
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658080; x=1790262880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GjrcoUvvTRR8V2GjuvP2w4blCOCAR9ShGqbE3Pn80+U=;
        b=WyzNYYMF1FrGtEsnLzxpTnFMfsYpKN9vVtDlOr7FNwOE8l1jVjrT32efF3ZYYhqtIj
         KHO6K78Wa33ZH+ibEpQEF5io7gBEc6fTj1nSc+WT5gkpSxR1W9xRnjOooFUJcQsn86PM
         wm8zkYrIXt7fC4dZ5BPpihoIn+nM/W5JDPn3h+rc8FUZFTAAm/SA0jBClXJOmMpnQpgG
         SWKZuSNzkZ9asbJpywLsW60ZaUEmeL/aapOzClgF9490fnOxTbWWW13+zWo1Wo7uPc8c
         fwLarh/a8kaMf/Z2EuwqUhSQgIp0LuaVL2fHKYWC4Je5mBA9o9w3DwzlLEo77Kqcicxz
         UHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658080; x=1790262880;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GjrcoUvvTRR8V2GjuvP2w4blCOCAR9ShGqbE3Pn80+U=;
        b=mEsoVqCO7LX29tck3QymR9lrEpCw6yqwcr4sL/REgWWDbMHC6JhclpUbQZovYq9FZP
         q9cllMygTbkaVkhPoEckgLejj6imPHjidMzFBrkXW34ITZCpur33WK3CQCotrK0ruxuV
         dhhBaovGsQOjDERN/wubPSEy6dh0clBdmD73zG3uI556cYaFUNNyDHfmjGS6Rno9q+6d
         yhET7u1EggHH1ydyiSDuDZ6E+8+71z66Utu0BlAjVPRo0FDnDY7L1fuKZWTqjLQPRDnu
         33/9AAuxEPSsEVHc9NxzimC/jv4fK70X3YXEQNuar3bvlMw9R4abq+/lfyxzSOGsQuJf
         Jhyw==
X-Forwarded-Encrypted: i=1; AKwUvBwzCiVIgxSkWMBeDkMuYRddfExx6skaVFkcljaON+B/WQHmkEjQ6FxYD9Xc8BEEvM3tUPJpaf4Bduct@vger.kernel.org
X-Gm-Message-State: AFuF++k94/mP/JfkxPqDdPspB05VbX6uFw2t8OBqASEYm81RgtNS8AQL
	2Zf5a7wjqBlFiKhoMKY/RJgNzfDmN4rd8jbRfLxW+ymDKdDwIwUfvbJ0I7NmnUPlLH6D6NWYqZ6
	7HteUy6nkxPzrhtwamL/UOGzA4IaD7/CiDf4bnwpFRUt/ln5FHhElM3hJGrNpPBVI
X-Gm-Gg: AYBFou3zyasvP9wTHL1T8AmoT938rXOM+KhgCqKDXahYBaY1sZnkiCv2wBQkT2lYZsl
	cQzp7aPnZCjlwIzTQOpMVQiCs96vNfdYu0OfNgK4SHmHD6PxT/0VTTPPPwtBl3Ojf88k93x3ZL1
	+IkYJaPfyYRm4Y+mt+zOpPevkT0rDQYlPe8NU+Rccir3dSRwqLi9B1ID1sHxQmfGRgcLoPn/pWD
	aPc2/w4xnQTkZ8BHa+N/4If0GjU5D61jJR+rsDKJzVgMNxCOA5Esea165fxHabam5LuZxmlmzqV
	day8VWUbslml6u+0IHz20cMqaw26eEUqd9oo8LitWGxJCb5fh1dkpEuurRJjJOs7tC/TYxbJiXw
	59JscFhunhxGaJD8=
X-Received: by 2002:ac8:7c4d:0:b0:532:9adc:63b1 with SMTP id d75a77b69052e-5329adc71e4mr10865441cf.66.1789658079919;
        Thu, 17 Sep 2026 08:14:39 -0700 (PDT)
X-Received: by 2002:ac8:7c4d:0:b0:532:9adc:63b1 with SMTP id d75a77b69052e-5329adc71e4mr10864741cf.66.1789658079232;
        Thu, 17 Sep 2026 08:14:39 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fa7dsm16206450f8f.8.2026.09.17.08.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:14:38 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:14:36 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/15] arm64: dts: qcom: talos: Move PCIe phy and
 GPIOs to root port node
Message-ID: <lr6wb4f37c775a36xrbgpg232lyjdrni5tz2trdsitgfihchoo@r6u3kgtw5zay>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-11-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-11-6272b7caae9a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfX0eQLh2/hFy7N
 ZUxj0PfBmWOokvgVT6NsWFP8+VxvkVblhz+tbBy6Jut0MJeLYFwQIe53SiyB8nDGtPeJEcU5LqA
 YP99QkJQq4Yt9stoJ62mwS3xBLHaX2b29tVGpqCKzW0CCZxSHEcxwev4Zfj0AWmgW8Zd12yJnnE
 1NCZiielOlkstm1rHrXtnui7SxZWWt+V1xOjOvY+k4vLR3pc2uPfHkrScoFnRySIChuqwi9aq7M
 uqVv8Tgvp4NO1Cmb8R6vzWDNmbUUXWZyNOWuMlUjkUknmJgTetSyCgMAp5PkJsYfeTPDK9rC4vo
 Jb/9UofLzhBUqpuDoMVquRWHf3zB03ibCuisZy4Wb8aZWRXUBjnndxaNXlsMameB9R28VfHpjMs
 TkBdz7lnv6rp5Ei3Q4/hqeyjAb3KMSbxoRUSohXf0UQ0j1tKH8xns49xGl9VEAr8lNvEIOBdrh7
 crloNcZC6t52hohUeYQ==
X-Proofpoint-GUID: xSNlf2I08scYZfR-soSDsihd0IHwt4IL
X-Proofpoint-ORIG-GUID: xSNlf2I08scYZfR-soSDsihd0IHwt4IL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfX6gIYPW83TK3H
 OD0yEzEiw0DXFSlSbSsL71pOUVn+oVi4YKKBYUL/aOiwWX01sl1whNSSyIlhhCd2gzIqJSzVv4i
 afu5Z0RQYYNeJcXZI9AKK38raKaRNcE=
X-Authority-Analysis: v=2.4 cv=Y/VtIReN c=1 sm=1 tr=0 ts=6aac03e0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170216

On 26-09-17 17:55:25, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys from the controller to pcie_port0, and
> move perst-gpios/wake-gpios from the &pcie controller overrides to the
> &pcie_port0 node in the board files, renaming perst-gpios to reset-gpios
> to match the binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
